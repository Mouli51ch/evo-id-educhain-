// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EvoID {
    struct Token {
        string name;
        string documentHash;
        bool isVerified;
    }

    // Mapping from token ID to Token details
    mapping(uint256 => Token) private _tokens;

    // Modifier to check if a token exists
    modifier exists(uint256 tokenId) {
        require(bytes(_tokens[tokenId].name).length > 0, "Token does not exist");
        _;
    }

    // Create a new token
    function createToken(uint256 tokenId, string calldata name, string calldata documentHash) external {
        require(bytes(_tokens[tokenId].name).length == 0, "Token already exists");
        _tokens[tokenId] = Token(name, documentHash, false);
    }

    // Verify the token
    function verifyToken(uint256 tokenId) external exists(tokenId) {
        _tokens[tokenId].isVerified = true;
    }

    // Update token details
    function updateToken(uint256 tokenId, string calldata name, string calldata documentHash) external exists(tokenId) {
        _tokens[tokenId].name = name;
        _tokens[tokenId].documentHash = documentHash;
    }

    // Get token details
    function getToken(uint256 tokenId) external view returns (string memory name, string memory documentHash, bool isVerified) {
        require(bytes(_tokens[tokenId].name).length > 0, "Token does not exist");
        Token storage token = _tokens[tokenId];
        return (token.name, token.documentHash, token.isVerified);
    }
}
