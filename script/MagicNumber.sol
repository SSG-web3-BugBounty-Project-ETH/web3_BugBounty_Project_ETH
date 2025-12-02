// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attack{
    constructor(){
        assembly{
            mstore(0,{주소})
            return(22,10)
        }
    }
}
