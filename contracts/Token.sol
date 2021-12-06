// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8;

import "./ERC721.sol";
import "./Pug.sol";

// TODO: just fix this interface thing, idk how to do it

contract Token is Pug, IERC721 {

mapping (uint => address) pugApprovals;

function balanceOf(address _owner) external view returns (uint256) {
    return ownerPugCount[_owner];
  }

  function ownerOf(uint256 _tokenId) external view returns (address) {
    return pugToOwner[_tokenId];
  }

  function _transfer(address _from, address _to, uint256 _tokenId) private {
    ownerPugCount[_to]++;
    ownerPugCount[_from]--;
    pugToOwner[_tokenId] = _to;
    emit Transfer(_from, _to, _tokenId);
  }

  function transferFrom(address _from, address _to, uint256 _tokenId) external payable {
    require (pugToOwner[_tokenId] == msg.sender || pugApprovals[_tokenId] == msg.sender);
    _transfer(_from, _to, _tokenId);
  }

    // TODO: onlyOwnerOf modifier needs to be implemented
  function approve(address _approved, uint256 _tokenId) external payable onlyOwnerOf(_tokenId) {
    pugApprovals[_tokenId] = _approved;
    // Approval is part of erc721 i think
    emit Approval(msg.sender, _approved, _tokenId);
  }
}