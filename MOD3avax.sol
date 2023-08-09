// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract VotingMachine {

  uint256 public numberofvotes;
  address public voter;
  string public name = "pearl";
   

  constructor() {
    voter = msg.sender;
  }

  mapping(address => uint256) public totalvotes;

  // Minting function
  function minting(address to, uint256 votestoadd) public {
    require(msg.sender == voter, "Only the voter can mint the votes.");
    require(votestoadd > 0, "votes to add in machine must be greater than 0.");

    totalvotes[to] += votestoadd;
    numberofvotes  += votestoadd;
  }

  // Burning function
  function burning(address from, uint256 votestoburn) public {
    require(votestoburn <= totalvotes[from], "votes to burn  exceeds the total votes in the machine.");

    totalvotes[from] -= votestoburn;
    numberofvotes -= votestoburn;
  }

  // Transfering function
  function transfering(address to, uint256 votestotransfer) public {
    require(votestotransfer <= totalvotes[msg.sender], "votes to transfer in the machine exceeds the total votes.");
    require(to != address(0), "Cannot transfer to the zero address.");

    totalvotes[msg.sender] -= votestotransfer;
    totalvotes[to] += votestotransfer;
  }
}
