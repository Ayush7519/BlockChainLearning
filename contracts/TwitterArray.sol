// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//here we add the array to the twitter to store the history of the message of the particular account.

//creating the contract.
contract TwitterArray {
    //creating the mapping to show the relationship between the account and the message.
    mapping (address => string[]) public MyMessage;

    //now we create the function to store and create the twitts.
    function CreateTwits(string memory _twits) public {
        MyMessage[msg.sender].push(_twits);
        //this is how we add the elements in the arrays;
    }

    //now we get all the message from the array.
    function AllTwits(address _owner) public view returns (string[] memory){
        return MyMessage[_owner];
    }

    //now we create the function to retrive the particular twits from the blockchain.
    function OneTwits(address _owner, uint256 _i) public view returns (string memory){
        return MyMessage[_owner][_i];
    }
}