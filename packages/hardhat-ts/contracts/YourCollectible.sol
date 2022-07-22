pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

/**
 * @title Marvels Collectibles NFT
 * @author Ahiara Ikechukwu
 * @notice An example of a nft contract
 */

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol';
import '@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol';
import '@openzeppelin/contracts/utils/Counters.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract YourCollectible is ERC721, ERC721Enumerable, ERC721URIStorage, Ownable {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  constructor() ERC721('MarvelCollectibles', 'MCB') {}

  /**
   * @notice Base URI for computing {tokenURI}
   */
  function _baseURI() internal view virtual override returns (string memory) {
    return 'https://ipfs.io/ipfs/';
  }

  function _beforeTokenTransfer(
    address from,
    address to,
    uint256 tokenId
  ) internal override(ERC721, ERC721Enumerable) {
    super._beforeTokenTransfer(from, to, tokenId);
  }

  /**
   * @notice Destroys `tokenId`.
   * @param tokenId id of the token to destroy
   * Emits a {Transfer} event.
   */
  function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
    super._burn(tokenId);
  }

  function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721Enumerable) returns (bool) {
    return super.supportsInterface(interfaceId);
  }

  /**
   * @notice returns url of the token
   * @param tokenId id of the token
   */
  function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory) {
    return super.tokenURI(tokenId);
  }

  /**
   * @notice Mints tokenId and transfers it to `to`.
   * @param to address to which the token is minted
   * @param _tokenURI url of the token to mint
   *
   * Emits a {Transfer} event.
   */
  function mintItem(address to, string memory _tokenURI) public returns (uint256) {
    _tokenIds.increment();

    uint256 id = _tokenIds.current();
    _mint(to, id);
    _setTokenURI(id, _tokenURI);

    return id;
  }
}
