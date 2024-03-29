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
  const erc20 = await rest.ethers.getContract("TestERC20", deployer);
  const cUSD = erc20.address;
  const deployment = await deploy("MicroLoanFactory", {
    from: deployer,
    args: [cUSD, interestModule.address],
    log: true,
    // proxy: {
    //   proxyContract: "OptimizedTransparentProxy",
    // },
  });
  await interestModule.rely(deployment.address);
};

export default deployStorage;
deployStorage.id = "deploy_factory";
deployStorage.tags = ["MicroloanFactory"];
