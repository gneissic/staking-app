const hre = require("hardhat");

async function main() {
  const Completed = await hre.ethers.deployContract("Completed");

  await completed.waitForDeployment();
  console.log("deployed");
  console.log(await completed.getAddress());
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
