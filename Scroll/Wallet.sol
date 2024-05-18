// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WalletFactory {
    event WalletCreated(address walletAddress);

    function createWallet(address owner) public returns (address) {
        Wallet newWallet = new Wallet(owner);
        emit WalletCreated(address(newWallet));
        return address(newWallet);
    }
}

contract Wallet {
    address public owner;

    constructor(address _owner) {
        owner = _owner;
    }

    receive() external payable {}

    function transfer(address payable to, uint256 amount) public {
        require(msg.sender == owner, "Only the owner can transfer funds");
        to.transfer(amount);
    }
}

