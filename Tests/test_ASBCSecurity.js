const { expect } = require("chai");

describe("ASBCSecurity", function () {
    it("Should update security levels and deactivate robots", async function () {
        const ASBCSecurity = await ethers.getContractFactory("ASBCSecurity");
        const asbcSecurity = await ASBCSecurity.deploy();
        
        await asbcSecurity.updateSecurityLevel("0x000...", 45);
        const isActive = await asbcSecurity.checkSecurity("0x000...");
        expect(isActive).to.equal(false);
    });
});
