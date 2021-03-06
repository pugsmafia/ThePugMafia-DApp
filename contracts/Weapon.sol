// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Weapon is ERC721, Ownable {
    
    struct Weapon {
        uint8 rarity;
        uint8 firePower;
        uint8 ammoTimeLeft;
        
    }

    uint256 nextId = 0;

    mapping(uint256 => Weapon) private _tokenDetails;

    constructor(string memory name, string memory symbol) ERC721(name, symbol) {
        
    }

    function getTokenDetails() public view returns (Pug memory) {
        return _tokenDetails[tokenId];
    }

    function mint(/*todo*/) public onlyOwner {
        _safeMint(msg.sender, nextId);

        _tokenDetails[nextId] = Weapon(/**params */);
        nextId++;
    }

    
}