// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Collaboration {
    // Structure to represent a collaboration request between robot colonies
    struct CollaborationRequest {
        address requester; // The address of the robot requesting collaboration
        string requestDetails; // Description of the request (e.g., energy sharing, data exchange)
        uint256 timestamp; // Time when the request was made
    }

    // Mapping to store collaboration requests received by each robot
    mapping(address => CollaborationRequest[]) public collaborationRequests;

    // Event emitted when a collaboration request is made
    event CollaborationRequested(address indexed requester, string requestDetails);

    // Function for a robot to request collaboration from another robot
    function requestCollaboration(address target, string memory requestDetails) external {
        // Create a new collaboration request with the provided details
        CollaborationRequest memory newRequest = CollaborationRequest(msg.sender, requestDetails, block.timestamp);
        
        // Store the request in the target robot's collaboration requests array
        collaborationRequests[target].push(newRequest);
        
        // Emit an event to signal that a collaboration request was made
        emit CollaborationRequested(msg.sender, requestDetails);
    }

    // Function to retrieve all collaboration requests received by a specific robot
    function getRequests(address target) external view returns (CollaborationRequest[] memory) {
        // Return the array of collaboration requests for the target robot
        return collaborationRequests[target];
    }
}
