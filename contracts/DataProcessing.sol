// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataProcessing {
    // Structure to represent the data collected by robots
    struct Data {
        string dataType;
        string dataValue;
        uint256 timestamp;
    }

    // Mapping to store data collected by each robot
    mapping(address => Data[]) public robotData;

    // Event emitted when data is stored by a robot
    event DataStored(address indexed robot, string dataType, string dataValue);

    // Function to store data collected by a robot
    function storeData(address robot, string memory dataType, string memory dataValue) external {
        // Create a new data structure with the provided details
        Data memory newData = Data(dataType, dataValue, block.timestamp);
        
        // Store the data in the robot's data array
        robotData[robot].push(newData);
        
        // Emit an event to signal that data has been stored
        emit DataStored(robot, dataType, dataValue);
    }

    // Function to retrieve all data collected by a specific robot
    function getData(address robot) external view returns (Data[] memory) {
        // Return the array of data collected by the robot
        return robotData[robot];
    }
}
