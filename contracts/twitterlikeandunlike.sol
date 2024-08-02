// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//define the contract.
contract TwitterLikenUnline{
    //now we define the structure to store the twits of the user.
    struct Twits{
        uint256 id;
        address author;
        string twitscontent;
        uint256 timestamp;
        uint256 likes;
    }
    //now we define the mapping for the twitter including the array.
    mapping (address => Twits[]) public Twitscontent;

    address public owner;
    constructor(){
        owner = msg.sender;
    }
    //now we defint the function to create the twits having the limit of the word.
    modifier twitslenght(string memory _twitscontent){
        require(bytes(_twitscontent).length <=300,"this is too long bro");
        _;
    }

    //now we make the modifier to check if the twits is present or not.
    modifier  twitsPresentcheck(address author, uint256 id){
        require(Twitscontent[author][id].id == id,"the twits is not present");
        _;
    }

    // now we define the function to create the twits.
    function createTwits(string memory _twitscontent) public twitslenght(_twitscontent){
        //now we save the twits after the validations.
        Twits memory newtwitsobject = Twits({
            id:Twitscontent[msg.sender].length,
            author: msg.sender,
            twitscontent: _twitscontent,
            timestamp: block.timestamp,
            likes:0
        });
        Twitscontent[msg.sender].push(newtwitsobject);
    }

    //now we make the function to like the twits.
    function likeTwits(address author, uint256 _id) public twitsPresentcheck(author,_id) {
        //here we have to check if the twits is present or not.
        // require(Twitscontent[author][_id].id == _id,"the twits is not present!!");
        Twitscontent[author][_id].likes++;
    }

    //now we make the function to dislike the twits.
    function dislikeTwits(address author, uint256 _id) public {
        //again we have to chaeck the twits is present or not.
        require(Twitscontent[author][_id].id == _id,"the twits is not present");
        //again we have to check the twits like doesnot goes to the negative.
        require(Twitscontent[author][_id].likes > 0,"this cannot be in the negative");
        Twitscontent[author][_id].likes--;
    }

    //now making the function to see the twits of the sender.
    function getTwits(address _owner, uint256 _id) public view returns (Twits memory){
        return Twitscontent[_owner][_id];
    }
}