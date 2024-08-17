const { ethers } = require("hardhat");

async function main() {
    const ASBCSecurityAddress = "deployed_contract_address_here";
    const ASBCSecurity = await ethers.getContractAt("ASBCSecurity", ASBCSecurityAddress);

    // Güvenlik seviyesini güncelleme örneği
    await ASBCSecurity.updateSecurityLevel("robot_address_here", 75);
    const securityLevel = await ASBCSecurity.securityLevels("robot_address_here");
    console.log("Security Level:", securityLevel);
}

main();
