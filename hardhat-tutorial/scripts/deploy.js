async function main() {
    const [deployer] = await ethers.getSigners();
  
    console.log("Deploying contracts with the account:", deployer.address);
  
    console.log("Account balance:", (await deployer.getBalance()).toString());
  
    const assetsContract = await ethers.getContractFactory("assetsContract");
    const paymentsContract = await ethers.getContractFactory("paymentsContract");
    const shipmentInformation = await ethers.getContractFactory("shipmentInformation");
    const kycInfoContract = await ethers.getContractFactory("kycInfoContract");

    const contract1 = await assetsContract.deploy();
    const contract2 = await paymentsContract.deploy();
    const contract3 = await shipmentInformation.deploy();
    const contract4 = await kycInfoContract.deploy();

    console.log("assetsContract address:", contract1.address);
    console.log("paymentsContract address:", contract2.address);
    console.log("shipmentInformationContract address:", contract3.address);
    console.log("kycContract address:", contract4.address);

  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });
  