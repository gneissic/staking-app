const hre = require("hardhat");

async function main() {
    const completedContract  = await hre.ethers.getContractAt("Completed")
    const completedAddress  = await completedContract.getAddress()
  const lock = await hre.ethers.deployContract("StakingApp", [completedAddress]);

  await lock.waitForDeployment();

  console.log("deployed");

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
