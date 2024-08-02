// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract twitter{
    //writing the code for the twitter contract.
    //to show the realtionship between the user and their twits we use the function called mapping.
    mapping (address => string) public twitts;

    //now we create the function that create the twitts of the user.
    function createTwits(string memory _twit) public {
        twitts[msg.sender] = _twit;
    }

    //now we create the function that retrive the twitts of the user.
    function getTwits(address _owner) public view returns (string memory) {
        return twitts[_owner];
    }

    }