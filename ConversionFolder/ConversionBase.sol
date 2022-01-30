// SPDX-License-Integration: MIT

pragma solidity >=0.6.0 <0.9.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract ConversionBase{
    string[] private pairs;
    address[] private addresses;

    constructor(string[] memory _pairs, address[] memory _addresses)
    {
        pairs = _pairs;
        addresses = _addresses;
    }
    
    mapping(string => address) internal pairAddresses;

    function mapPairsWithAddresses() internal{
        for(uint idx = 0; idx<addresses.length;idx++){
            pairAddresses[pairs[idx]] = addresses[idx];
        }
    }

    function getAddressByPair(string memory pair) public view returns(address){
        return pairAddresses[pair];
    }

    function getAllPossiblePairs() public view returns(string[] memory){
        return pairs;
    }
}