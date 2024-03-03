// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Completed{
    bool public completed;

    function isComplete() public payable{
        completed = true;
    }
}