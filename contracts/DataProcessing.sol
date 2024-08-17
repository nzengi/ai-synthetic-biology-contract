// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataProcessing {
    struct Data {
        string dataType;
        string dataValue;
        uint256 timestamp;
    }

    mapping(address => Data[]) public robotData;

    event DataStored(address indexed robot, string dataType, string dataValue);

    function storeData(address robot, string memory dataType, string memory dataValue) external {
        Data memory newData = Data(dataType, dataValue, block.timestamp);
        robotData[robot].push(newData);
        emit DataStored(robot, dataType, dataValue);
    }

    function getData(address robot) external view returns (Data[] memory) {
        return robotData[robot];
    }
}
