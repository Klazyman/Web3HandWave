// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    address public owner;
    
    mapping (address => uint) senderWaveCount;
 
    constructor() {
        owner = msg.sender;
        console.log("Hi all, Klazyman is in the HOUSE");
    }

    modifier ownerOf() {
        require(msg.sender == owner);
        _;
    }

    function addressWaveCount(address _waveAddress) public view returns (uint256) {
        console.log("Owner has %d total waves at you", senderWaveCount[_waveAddress]);
        return senderWaveCount[_waveAddress];
    }

    function wave() public ownerOf {
        totalWaves += 1;
        senderWaveCount[msg.sender]++;
        console.log("%s has waved at you", msg.sender);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }
}