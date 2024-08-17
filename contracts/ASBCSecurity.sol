// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ASBCSecurity {
    mapping(address => uint256) public securityLevels;
    uint256 constant public MIN_SECURITY_THRESHOLD = 50;

    event SecurityUpdated(address indexed robot, uint256 securityLevel);

    function updateSecurityLevel(address robot, uint256 securityLevel) external {
        securityLevels[robot] = securityLevel;
        emit SecurityUpdated(robot, securityLevel);

        if (securityLevel < MIN_SECURITY_THRESHOLD) {
            deactivateRobot(robot);
        }
    }

    function deactivateRobot(address robot) internal {
        // Robotu devre dışı bırakma işlemi
        // (Örn. başka bir sistemle entegrasyon)
    }

    function checkSecurity(address robot) external view returns (bool) {
        return securityLevels[robot] >= MIN_SECURITY_THRESHOLD;
    }
}
