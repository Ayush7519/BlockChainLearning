// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//define the contract.
contract Twitter{
    //define the structure to store the contract.
    struct Twits{
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    //now we define the mapping for the structure with the array.
    mapping(address => Twits[]) public twitss;

    //here we define the event for the contracts.
    event TwitsCreate(uint256 id, address author, string content, uint256 timestamp);
    event TwitsLikes(address liker, address author, uint256 id, uint256 likecount);
    event TwitsUnlike(address unliker, address author, uint256 id, uint256 likecount);

    //now we define the constructor.
    address public owner;
    constructor(){
        owner=msg.sender;
    }

    //creating the modifier for the length validation of the twits.
    modifier twitsLength(string memory _content){
        require(bytes(_content).length <= 300,"The twits is too long bro");
        _;
    }

    //now we define the function to create the twits.
    function createTwits(string memory _content) public twitsLength(_content){
        Twits memory newcontentobject = Twits({
            id: twitss[msg.sender].length,
            author: msg.sender,
            content: _content,
            timestamp: block.timestamp,
            likes: 0 
        });
        twitss[msg.sender].push(newcontentobject);

        //here we implement the event when the twits is sucessfully created.
        emit TwitsCreate(newcontentobject.id, newcontentobject.author, newcontentobject.content, newcontentobject.timestamp);
    }

    //now we create the function to like the twits.
    function likeTwits(address author, uint256 _id) public {
        //first we see if the twits is present or not.
        require(twitss[author][_id].id == _id,"The twits is not present");
        twitss[author][_id].likes++;

        //here we use the event after the like is sucessfully done.
        emit TwitsLikes(msg.sender, author, _id, twitss[author][_id].likes);
    }

    //now we create the function to unlike the twits.
    function unlikeTwits(address author, uint256 _id) public {
        //again validate the twits id.
        require(twitss[author][_id].id == _id,"The twits is not present");
        //vlaidate if the twits like dont goes in the negative.
        require(twitss[author][_id].likes > 0 ,"some thing went wrong in the unlike twits");
        twitss[author][_id].likes--;

        //here we implement the unlike events.
        emit TwitsUnlike(msg.sender, author, _id, twitss[author][_id].likes);
    }

    //now we define the function to see the twits(all).
    function allTwits() public view returns (Twits[] memory){
        return twitss[msg.sender];
    }

    //now we create the function that return the twits based on the ids.
    function getTwits(uint256 _id) public view returns (Twits memory){
        return twitss[msg.sender][_id];
    }

}