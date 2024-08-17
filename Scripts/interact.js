const { ethers } = require("hardhat");

async function main() {
    // Specify the deployed contract address (replace with actual address after deployment)
    const ASBCSecurityAddress = "deployed_contract_address_here";

    // Get the contract instance
    const ASBCSecurity = await ethers.getContractAt("ASBCSecurity", ASBCSecurityAddress);

    // Example interaction: update the security level of a robot
    await ASBCSecurity.updateSecurityLevel("robot_address_here", 75);
    
    // Retrieve and log the updated security level
    const securityLevel = await ASBCSecurity.securityLevels("robot_address_here");
    console.log("Security Level:", securityLevel);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
