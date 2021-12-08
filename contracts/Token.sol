// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Token is ERC721, Ownable {
    
    struct Pug {
        string name;
        uint8 rarity;
        uint8 health;
        
    }

    uint256 nextId = 0;

    mapping(uint256 => Pug) private _tokenDetails;

    constructor(string memory name, string memory symbol) ERC721(name, symbol) {
        
    }

    function getTokenDetails() public view returns (Pug memory) {
        return _tokenDetails[tokenId];
    }

    function mint(/*todo*/) public onlyOwner {
        _safeMint(msg.sender, nextId);

        _tokenDetails[nextId] = Pug(/**params */);
        nextId++;
    }

    
}