//SPDX-License-Identifier: MIT

// pragma solidity 0.8.1;
pragma solidity >=0.4.22 <0.9.0;


contract smartWallet{
    
    // emit results 
    event AllowanceChanged(address _ConsumerAccount, uint _MovementIndex);

    address public account_owner;

    // address the owner of the smart contract 
    constructor () {
        account_owner = msg.sender;
    }
    
    // different commands for the robot car
    enum ActionChoices { GoLeft, GoRight, GoStraight, SitStill }
    ActionChoices choice;
    ActionChoices constant defaultChoice = ActionChoices.GoStraight;
    
    address public request_sender; 
    
    // for the smart contract to receive money 
    function ReceiveMoney () public payable{
        request_sender = msg.sender;
    }
    
    // function ReceiveMoney() payable public {    
    // // nothing to do here
    // }
    
    function getBalance () public view returns (uint){
        return address(this).balance;
    }
    
    function withDrawMoney () public {
        require(msg.sender == account_owner, "You are not allowed to withdraw money");
        address payable to = payable(msg.sender);
        to.transfer(this.getBalance());
    }
    
    modifier OwnerOrConsumer (){ 
        // require (isOwner() || allowance[msg.sender] >=  _amount, "You are not the account_owner");
        require(msg.sender == account_owner || msg.sender == request_sender, "You are not authorized to move the car, payment needed~");
        _;
    }

    function setValues(uint _value) public OwnerOrConsumer(){
        require( uint(ActionChoices.SitStill) >= _value, "Invalid input, try again~");
        choice = ActionChoices(_value);
        emit AllowanceChanged(msg.sender, _value);
    }
    
    function getChoice() public view returns (ActionChoices) {
        return choice;
    }
}








