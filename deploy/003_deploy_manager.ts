import { DeployFunction } from "hardhat-deploy/types";

const deployStorage: DeployFunction = async function ({
  getNamedAccounts,
  deployments,
  getChainId,
  getUnnamedAccounts,
  ...rest
}) {
  const { deployer } = await getNamedAccounts();
  const { deploy } = deployments;
  console.log(`Deploying FundManager from address ${deployer}`);

  const loanFactory = await rest.ethers.getContract(
    "MicroLoanFactory",
    deployer
  );

  const erc20 = await rest.ethers.getContract("TestERC20", deployer);
  const cUSD = erc20.address;

  const managerSymbol = "TST";
  const deployment = await deploy("FundManager", {
    from: deployer,
    args: [managerSymbol, 10 ** 10, loanFactory.address, cUSD, deployer],
    log: true,
    // proxy: {
    //   proxyContract: "OptimizedTransparentProxy",
    // },
  });
  console.log(
    `Deployed FundManager ${managerSymbol} at address ${deployment.address}`
  );
};

export default deployStorage;
deployStorage.id = "deploy_manager";
deployStorage.tags = ["FundManager"];
