// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//now we create the contract for this task.
contract TwitterNotification{
    //now we define the structure for the notification.
    struct Notification{
        address user;
        string notificationcontent;
        uint256 timestamp;
    }

    //now we defint the mapping to show the relation between the srtuct and the user.
    mapping (address => Notification[]) public notificationdata;

    //now we create the function to create the notification in the blockchain.
    function CreateNotification(string memory _notifdata) public {

        //before saving the data in the struct we first check the condition.
        //from this we cannot get the length of the notification data so we have to convert it in to the byte format.
        require(bytes(_notifdata).length <= 300, "brrooo this is too long");

        //if this statement is right then we save the data in the struct.
        Notification memory newnotificationdata = Notification({
            user: msg.sender, //this is the address of the user blockchain or wallet.
            notificationcontent: _notifdata,
            timestamp:block.timestamp
        });
        //now we have to place the struct in the array. 
        notificationdata[msg.sender].push(newnotificationdata);
    }

    //now we retrive all the message from the blockchain.
    function GetNotification(address _owner) public view returns (Notification[] memory){
        return notificationdata[_owner];
    }

}