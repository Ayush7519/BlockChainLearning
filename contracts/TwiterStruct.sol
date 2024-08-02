// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//here we define the struct and add that struct to the array.

//define the contract.
contract TwitterStruct{

    //creating the struct for the twits.
    struct twits{
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    //defining the mapping for the twits and the user.
    mapping (address => twits[]) public MyStwitter;

    //now defining the function to add the twits in the blockchain.
    function AddTwitsStruc(string memory _twits) public {
        //here we use the memory to store the data in the virtual memory like thing and after completing the function this block is transfer to the blocchain directly.
        twits memory newtwits = twits({
            author: msg.sender,
            content: _twits,
            timestamp: block.timestamp,
            likes:10
        });
        //now we push this struct in the array.
        MyStwitter[msg.sender].push(newtwits);
    }

    //now we retrive all the message from the struct.
    function AllTwits(address _owner) public view returns (twits[] memory){
        return MyStwitter[_owner];
    }

    //now we retrive the particular twits.
    function OneTwits(address _owner, uint256 _i) public view  returns (twits memory){
        return MyStwitter[_owner][_i];
    }

}