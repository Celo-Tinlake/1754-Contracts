import { DeployFunction } from "hardhat-deploy/types";

const deployStorage: DeployFunction = async function ({
  getNamedAccounts,
  deployments,
  getChainId,
  getUnnamedAccounts,
  ...rest
}) {
  // await hre.run('compile');
  const { deployer } = await getNamedAccounts();
  const { deploy } = deployments;
  const interestModule = await rest.ethers.getContract(
    "InterestModule",
    deployer
  );
  const cUSD = "0x874069Fa1Eb16D44d622F2e0Ca25eeA172369bC1";
  await deploy("MicroLoanFactory", {
    from: deployer,
    args: [cUSD, interestModule.address],
    log: true,
    // proxy: {
    //   proxyContract: "OptimizedTransparentProxy",
    // },
  });
};

export default deployStorage;
deployStorage.id = "deploy_factory";
deployStorage.tags = ["MicroloanFactory"];
