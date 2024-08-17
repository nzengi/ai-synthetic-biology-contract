// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Incentives {
    // Mapping to track rewards accumulated by each robot
    mapping(address => uint256) public rewards;

    // Event emitted when a reward is granted to a robot
    event RewardGranted(address indexed robot, uint256 amount);

    // Function to grant a reward to a robot for successful completion of a task or collaboration
    function grantReward(address robot, uint256 amount) external {
        // Add the reward amount to the robot's balance
        rewards[robot] += amount;
        
        // Emit an event to signal that a reward was granted
        emit RewardGranted(robot, amount);
    }

    // Function for a robot to claim its accumulated rewards
    function claimReward(address robot) external {
        // Retrieve the robot's reward balance
        uint256 reward = rewards[robot];
        
        // Reset the robot's reward balance to zero
        rewards[robot] = 0;
        
        // Transfer the reward to the robot's address
        payable(robot).transfer(reward);
    }

    // Fallback function to allow the contract to receive funds for rewards
    receive() external payable {}
}
