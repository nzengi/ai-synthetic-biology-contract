// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Incentives {
    mapping(address => uint256) public rewards;

    event RewardGranted(address indexed robot, uint256 amount);

    function grantReward(address robot, uint256 amount) external {
        rewards[robot] += amount;
        emit RewardGranted(robot, amount);
    }

    function claimReward(address robot) external {
        uint256 reward = rewards[robot];
        rewards[robot] = 0;
        payable(robot).transfer(reward);
    }

    receive() external payable {}
}
