// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// now creating the smart contract.
contract Calculator{
    uint256 result = 0;

    //now we ccreate the function for the calculator.
    function add(uint256 num) public {
        result += num; 
    }

    function sub(uint256 num) public {
        result -= num;
    }

    function multiple(uint256 num) public {
        result *= num;
    }

    function get() public view returns (uint256) {
        return result;
    }

}