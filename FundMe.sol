// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

//importing from NPM/Github

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./ConversionFolder/ConversionApp.sol";
import "./ConversionFolder/NetworkType.sol";

contract FundMe{
    mapping(address => uint256) public addressToAmountFunded;
    address[] funders;
    address public owner;
    uint256 public minimumUSDThreshold = 0;
    
    ConversionApp cApp;
    
    constructor() public {
        owner = msg.sender;
        cApp = new ConversionApp(NetworkType.Rinkeby);
    }

    function fund() public payable {
        uint256 minimumUSD = minimumUSDThreshold * 10 ** 18;

        cApp.convert(msg.value);
        uint256 conversionRate = cApp.getConversionValue();

        require(conversionRate > minimumUSD, "You need to spend more ETH");
        require(msg.sender != owner,"You can't fund to yourself!");

        if(addressToAmountFunded[msg.sender] == 0){
            funders.push(msg.sender);
        }

        addressToAmountFunded[msg.sender] += msg.value;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can call this function");
        _; 
    }

    function setMinimumUSDThreshold(uint256 newAmountInDollars) public onlyOwner{
        minimumUSDThreshold = newAmountInDollars;
    }

    function seeAllFundsAndFunders() public onlyOwner view returns(address[] memory, uint256[] memory){
        uint256 len = funders.length;
        uint256[] memory values = new uint256[](len);

        for (uint256 i = 0 ; i <  len ; i++) {
            address funderAddress = funders[i];
            values[i] = addressToAmountFunded[funderAddress];
        }
        return (funders, values);
    }

    function withdraw() public onlyOwner payable{
        payable(msg.sender).transfer(address(this).balance);
    }
}