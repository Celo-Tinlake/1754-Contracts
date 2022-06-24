import "@typechain/hardhat";
import "@nomiclabs/hardhat-ethers";
import "@nomiclabs/hardhat-etherscan";
import "@nomiclabs/hardhat-solhint";
import "@nomiclabs/hardhat-waffle";
import "hardhat-deploy";
import { fornoURLs, ICeloNetwork } from "@ubeswap/hardhat-celo";
import "dotenv/config";
import "hardhat-abi-exporter";
import { removeConsoleLog } from "hardhat-preprocessor";
import { HardhatUserConfig, task } from "hardhat/config";
import { HDAccountsUserConfig } from "hardhat/types";
import "solidity-coverage";
import { MicroLoanFactory } from "./typechain-types/MicroLoanFactory";
import { FundManager } from "./typechain-types/FundManager";
import { InterestModule } from "./typechain-types/InterestModule";

// task("test", "Test the contracts", async () => {});
const accounts: HDAccountsUserConfig = {
  mnemonic:
    process.env.MNEMONIC ||
    "test test test test test test test test test test test junk",
};

task("manager", "Deploys a fund manager")
  .addParam("symbol", "Fund manager symbol", "1754")
  .addParam("senior")
  .setAction(
    async (args: { symbol: string; senior: string }, hre, runSuper) => {
      const { deployer } = await hre.getNamedAccounts();
      const { symbol, senior } = args;
      const loanFactoryContract =
        await hre.ethers.getContract<MicroLoanFactory>(
          "MicroLoanFactory",
          deployer
        );
      const delegateFactory = await hre.ethers.getContractFactory(
        "DelegatorWhitelistAll"
      );
      const managerFactory = await hre.ethers.getContractFactory(
        "FundManager",
        deployer
      );

      const delegatorDeployment = await delegateFactory.deploy();
      const depositToken = "0x874069Fa1Eb16D44d622F2e0Ca25eeA172369bC1";

      const manager = await managerFactory.deploy(
        symbol,
        senior,
        loanFactoryContract.address,
        depositToken,
        delegatorDeployment.address
      );

      console.log(`Manager ${symbol} deployed at ${manager.address}`);
    }
  );

task("request")
  .addParam("amount")
  .addParam("days")
  .setAction(
    async ({ amount, days }: { amount: string; days: string }, hre) => {
      const { deployer } = await hre.getNamedAccounts();

      const requestAmount = (parseFloat(amount) * 10 ** 18).toFixed(0);
      const duration = parseInt(days, 10) * 24 * 60 * 60;
      const loanFactoryContract =
        await hre.ethers.getContract<MicroLoanFactory>(
          "MicroLoanFactory",
          deployer
        );
      await loanFactoryContract.requestLoan("1", requestAmount, duration);
    }
  );

task("connect").setAction(async (_, hre) => {
  const { deployer } = await hre.getNamedAccounts();

  const interestModule = await hre.ethers.getContract<InterestModule>(
    "InterestModule",
    deployer
  );

  const loanFactoryContract = await hre.ethers.getContract<MicroLoanFactory>(
    "MicroLoanFactory",
    deployer
  );

  await interestModule.rely(loanFactoryContract.address);
});

task("auto_invest")
  .addParam("manager", "address of manager for auto investing")
  .setAction(async ({ manager }: { manager: string }, hre) => {
    const { deployer } = await hre.getNamedAccounts();
    const loanFactoryContract = await hre.ethers.getContract<MicroLoanFactory>(
      "MicroLoanFactory",
      deployer
    );
    const managerContract = await hre.ethers.getContractAt<FundManager>(
      "FundManager",
      manager
    );
    const id = await loanFactoryContract.IDs();
    while (true) {
      const newId = await loanFactoryContract.IDs();
      if (!newId.eq(id)) {
        console.log("Fulfilling loan");
        await managerContract.fundLoan(id);
        break;
      }
      await sleep(1000);
    }
  });

const sleep = (milliseconds: number) => {
  return new Promise((resolve) => setTimeout(resolve, milliseconds));
};

// , async (args, hre, runSuper) => {
//   const launch = <NodeLaunch>await hre.ethers.getContract("NodeLaunch");
//   await launch.setBaseURI(
//     "https://raw.githubusercontent.com/Node-Fi/NodeLaunch/main/metadata/"
//   );
// });

// const accounts = [`0x${process.env.PRIVATE_KEY_DEV}`];

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
export default {
  abiExporter: {
    path: "./build/abi",
    flat: true,
  },
  defaultNetwork: "hardhat",
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY,
  },
  networks: {
    mainnet: {
      url: fornoURLs[ICeloNetwork.MAINNET],
      accounts,
      chainId: ICeloNetwork.MAINNET,
      live: true,
      gasPrice: 0.5 * 10 ** 9,
      gas: 10000000,
    },
    alfajores: {
      url: fornoURLs[ICeloNetwork.ALFAJORES],
      accounts,
      chainId: ICeloNetwork.ALFAJORES,
      live: true,
      gasPrice: 0.5 * 10 ** 9,
      gas: 8000000,
      verify: {
        etherscan: {
          apiKey: process.env.ETHERSCAN_API_KEY,
          apiUrl: "https://alfajores.celoscan.xyz/",
        },
      },
    },
    hardhat: {
      chainId: 31337,
      accounts,
    },
  },
  paths: {
    deploy: "deploy",
    sources: "./src",
    tests: "./integration_test",
    cache: "./build/cache",
    artifacts: "./build/artifacts",
    imports: "imports",
    deployments: "deployments",
  },
  preprocess: {
    eachLine: removeConsoleLog(
      (bre) =>
        bre.network.name !== "hardhat" && bre.network.name !== "localhost"
    ),
  },
  solidity: {
    version: "0.8.13",
    settings: {
      optimizer: {
        enabled: true,
        runs: 5000,
      },
    },
  },
  spdxLicenseIdentifier: {
    overwrite: false,
    runOnCompile: true,
  },
  tenderly: {
    project: process.env.TENDERLY_PROJECT,
    username: process.env.TENDERLY_USERNAME,
  },
  watcher: {
    compile: {
      tasks: ["compile"],
      files: ["./src"],
      verbose: true,
    },
  },
  namedAccounts: {
    deployer: 0,
  },
} as HardhatUserConfig;
