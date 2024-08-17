async function main() {
    // Get the account that will deploy the contracts
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer.address);

    // Deploy the ASBCSecurity contract
    const ASBCSecurity = await ethers.getContractFactory("ASBCSecurity");
    const asbcSecurity = await ASBCSecurity.deploy();
    console.log("ASBCSecurity deployed to:", asbcSecurity.address);

    // Deploy other contracts (e.g., DataProcessing, Collaboration, Incentives) similarly
    // Example:
    // const DataProcessing = await ethers.getContractFactory("DataProcessing");
    // const dataProcessing = await DataProcessing.deploy();
    // console.log("DataProcessing deployed to:", dataProcessing.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
