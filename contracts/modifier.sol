// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract TokenTransfer{
    bool public paused;
    address public owner;

    //now we define the mapping function.
    mapping (address => uint) public balance;

    //now we define the constructor which is called when the contract is deployed in the blockchain.
    constructor(){
        owner = msg.sender;
        paused = false;
        balance[owner] = 1000;
    }

    //now we define the modifer that chaeck wheather the person is owner or not.
    // modifier onlyOwner(){
    //     require(msg.sender == owner, "SORRY YOU ARE NOT THE OWNER");
    //     _ ;
    // }
    //now we define the modifier that accept the parameter.
    modifier MynewModifire(uint _balance){
        require(_balance <= 1000, "insufficient balance.");
        _;
    }

    //NOW Making the function to do some task.
    function transfer(address to, uint amount) public MynewModifire(balance[msg.sender]){
        balance[msg.sender] -= amount;
        balance[to] += amount;
    }
}