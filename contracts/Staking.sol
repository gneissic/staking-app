// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "./Completed.sol";

 import "hardhat/console.sol";
 error StakingApp__THresholdNotMet( uint256 value);
 error StakingApp__DeadlineNotYetMet();
 error  StakingApp__WithdrawalFailed( );
contract StakingApp {
    Completed public completed;
mapping (address => uint256) public balances;
uint256 public constant threshold = 1 ether;
event staked(uint256 indexed value, address indexed sender);
event executed();
uint256 public  deadline = block.timestamp + 72 hours;


 constructor(address externalAddress) {
      completed = Completed(externalAddress);
  }

    function stake() public payable {
       
            balances[msg.sender] += msg.value;

            emit staked(msg.value, msg.sender);
       
    }


    function executePayment()meetThreshold public payable{
        

        if (block.timestamp >= deadline) {
            completed.isComplete{value: address(this).balance}();
        } 
        emit executed();
    }

    function withdraw()meetThreshold public payable{
        if (timeLeft() == 0) {
            revert StakingApp__DeadlineNotYetMet();
        } 
          uint256 amount  = balances[msg.sender];
        balances[msg.sender] = 0;
        (bool success, )  = msg.sender.call{value:amount}("");
        if (!success) {
            revert StakingApp__WithdrawalFailed();
        } 
    }

    function metThreshold() public view returns(bool) {
        return address(this).balance <= threshold;
    }
    function timeLeft()public view returns (uint256) {
        return deadline - block.timestamp;
     
           
    }
    modifier meetThreshold() {
        if (!metThreshold()) {
          revert  StakingApp__THresholdNotMet(msg.value);
        } 
        _;
    }
}
