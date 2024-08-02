// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//making the contract.
contract TwitterNotificatonModifier{

    //now we define the variable to store the twitter notification length.
    uint256 public twitterLength;

    //now we define the constructor to store the twitter notification.
    struct Notification{
        address author;
        string notificationcontent;
        uint256 timestamp;
    }
    //now we define the mapping for the struct that comtain array.
    mapping (address => Notification[]) public NotificationTwitter;

    //now we defien the construct to know how is the owner of this contract.
    address public owner;
    constructor(){
        owner = msg.sender;
    }

    //now we make the modifier to check if the user is owner or not.
    modifier onlyOwner(){
        require( msg.sender == owner,"you are not the owner you cannot set the twitter max length");
        _;
    }

    //now using this modifer in the function that can change the max length of the twits.
    function NotificationLengthFunction(uint256 _niotificationlenght) public onlyOwner(){
        twitterLength= _niotificationlenght;
    }
     //now we create the function to save the message in the blockchain.
    function CreateNotifictioin(string memory _notdata) public  {

        //now checing the length of the message.
        require(bytes(_notdata).length <= twitterLength, "this content is too long please make it short");

        //now we save the message in the struct form.
        Notification memory notificationobject = Notification({
            author: msg.sender,
            notificationcontent: _notdata,
            timestamp: block.timestamp
        });
        //now save the data in the struct array.
        NotificationTwitter[msg.sender].push(notificationobject); 
    }
}