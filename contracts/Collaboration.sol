// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Collaboration {
    struct CollaborationRequest {
        address requester;
        string requestDetails;
        uint256 timestamp;
    }

    mapping(address => CollaborationRequest[]) public collaborationRequests;

    event CollaborationRequested(address indexed requester, string requestDetails);

    function requestCollaboration(address target, string memory requestDetails) external {
        CollaborationRequest memory newRequest = CollaborationRequest(msg.sender, requestDetails, block.timestamp);
        collaborationRequests[target].push(newRequest);
        emit CollaborationRequested(msg.sender, requestDetails);
    }

    function getRequests(address target) external view returns (CollaborationRequest[] memory) {
        return collaborationRequests[target];
    }
}
