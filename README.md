# ETH_AVAX
# TYPES OF FUNCTIONS

In this code we are writing a smart contract to create our own token and deploy it using remix.
## Description

In this contract, we create our own token and use different functions such as mint fucntion which can be used by the owner only, burn and transfer function can be used by any of the user. The contract has been tested and deployed using Remix IDE. The functionalities of the contract has been explained in this Loom video.

## Getting Started

### Executing program


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

To compile the code, press CRTL+ SHIFT+P  then select Solidity compile contract and the program is compile sucessfully will be shown in console 
## Authors

Gurdeep Singh


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
