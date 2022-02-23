pragma solidity ^0.8.0;


import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

import { Base64 } from "./libraries/Base64.sol";

contract MyMusicNFT is ERC721URIStorage {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;
  
  event NewMusicNFTMinted(address sender, uint256 tokenId);

  constructor() ERC721 ("WallinNFT", "WALLIN") {
    console.log("This is my NFT contract. Woah!");
  }
  function random(string memory input) internal pure returns (uint256) {
      return uint256(keccak256(abi.encodePacked(input)));
  }

  function makeMusicNFT() public {
    uint256 newItemId = _tokenIds.current();

    string memory finalTokenUri = "ipfs://Qmbx27Hd2g7SYiGd2rUKUZG4i5TJb2eesxtZXLJqG7HfeQ";

    console.log("\n--------------------");
    console.log(finalTokenUri);
    console.log("--------------------\n");

    _safeMint(msg.sender, newItemId);
  
    _setTokenURI(newItemId, finalTokenUri);
  
    _tokenIds.increment();
    console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);
    
    // EMIT MAGICAL EVENTS.
    emit NewMusicNFTMinted(msg.sender, newItemId);
  }
}