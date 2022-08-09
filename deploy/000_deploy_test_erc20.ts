import { DeployFunction } from "hardhat-deploy/types";

const deployStorage: DeployFunction = async function ({
  getNamedAccounts,
  deployments,
  getChainId,
  getUnnamedAccounts,
}) {
  // await hre.run('compile');
  const { deployer } = await getNamedAccounts();
  const { deploy } = deployments;
  await deploy("TestERC20", {
    from: deployer,
    args: [],
    log: true,
    // proxy: {
    //   proxyContract: "OptimizedTransparentProxy",
    // },
  });
};

export default deployStorage;
deployStorage.id = "deploy_erc20";
deployStorage.tags = ["ERC20PresetFixedSupply"];
