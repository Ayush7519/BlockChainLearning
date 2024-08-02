// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//question.
//create the contract.
//ask the user to input the number and add that number in the blochchain.
//show thw user the added value.
//it work like the simple saving application.

contract Saving{
    //now we defint the mapping to store the indivisual user data.
    mapping (address => uint256) public Myvalue;

    //now defining the value to store and add the give value.
    uint256 data = 0;

    //now we create the function to add the user given data in the blockchanin data.
    function GetValue(uint256 _val) public {
        data += _val;
        Myvalue[msg.sender] = data;
    }

    //now we define the function to retrive the data from the blockchain.
    function Data(address _owner) public view returns (uint256){
        return Myvalue[_owner];
    }

}