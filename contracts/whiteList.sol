// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7 ;


contract whiteList {

address [] whiteListedArray;
uint256 maxWhitelistAdd;


/* the mapping to check the existance of the address before */
mapping (address => bool) whiteListMaping;
    constructor( uint256 _maxWhitelisted) {
        maxWhitelistAdd = _maxWhitelisted;
        
    }


    function addTothewhiteList () public {
        require (!whiteListMaping[msg.sender], "already white listed");
        require ( whiteListedArray.length < maxWhitelistAdd,"we have reached the maximum address");
        whiteListMaping[msg.sender] = true;
        whiteListedArray.push (msg.sender);
    }

    function numAddressesWhitelisted  () public view returns (uint256){
        return whiteListedArray.length;

    }

    function whitelistedAddresses (address _add) public view returns (bool){
        return whiteListMaping[_add];

    }




}

