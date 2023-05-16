// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address private _owner;

    constructor() ERC20("My Token", "MYT") {
        _owner = msg.sender;
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    modifier onlyOwner() {
        require(msg.sender == _owner, "Only the contract owner can call this function");
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

   function transfer(address to, uint256 amount) public returns (bool) {
    require(amount > 0, "Amount must be greater than zero");
    require(balanceOf(msg.sender) >= amount, "Insufficient balance");

    _transfer(msg.sender, to, amount);
    return true;
}

}
