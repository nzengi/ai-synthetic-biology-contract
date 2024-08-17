async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer.address);

    const ASBCSecurity = await ethers.getContractFactory("ASBCSecurity");
    const asbcSecurity = await ASBCSecurity.deploy();
    console.log("ASBCSecurity deployed to:", asbcSecurity.address);

    // Diğer sözleşmelerin dağıtımı benzer şekilde yapılacak...
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
