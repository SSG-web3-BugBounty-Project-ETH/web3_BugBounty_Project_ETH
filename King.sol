// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract attack {
    constructor(address payable _addr) payable {
        (bool ok,)=_addr.call{value: msg.value}("");
        require(ok);
    }
}
