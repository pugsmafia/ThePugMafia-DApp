// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8;

contract Pug {
    event NewPug(uint pugId, string name, uint rank);

    struct PugObject {
      string name;
      uint pugId;
      uint8 rank;
    }

    // A list of all our pugs
    PugObject[] public pugs;

    // The owner of each pug
    mapping (uint => address) public pugToOwner;

    // Number of pugs a user owns
    mapping (address => uint) ownerPugCount;

    // Create a new Pug with the latest ID available.
    // Add the pug to the msg.sender
    // Inform the front-end
    function _createPug(string memory _name, uint _rank) internal {
        pugs.push(PugObject(_name, _rank, 1));
        uint id = pugs.length - 1;
        pugToOwner[id] = msg.sender;
        ownerPugCount[msg.sender]++;
        emit NewPug(id, _name, _rank);
    }


}
