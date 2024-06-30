// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import " @openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken {
    string public name = "MyToken";
    uint256 public totalSupply = 100000000000000000000;
    uint8 public decimals = 18;

    mapping(address => uint256) private _balances;

    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    function transfer(address recipient, uint256 amount) public returns (bool) {
        uint256 senderBalance = _balances[msg.sender];
        require(
            senderBalance >= amount,
            "ERC20: transfer amount exceeds balance"
        );
        _balances[msg.sender] = senderBalance - amount;
        _balances[recipient] += amount;

        return true;
    }
}
