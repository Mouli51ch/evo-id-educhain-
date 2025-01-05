async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contract with account:", deployer.address);

  const EvoID = await ethers.getContractFactory("EvoID");
  const evoID = await EvoID.deploy();
  console.log("Deploying contract...");

  await evoID.deployed();
  console.log("EvoID Deployed Successfully on the Mentioned Network:", evoID.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
