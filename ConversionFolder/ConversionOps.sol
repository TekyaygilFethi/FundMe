// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract ConversionOps{

    address adr;

    constructor(address _adr){
        adr = _adr;
    }

    function getPrice() private view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(adr);
      
        (,int256 answer,,,) = priceFeed.latestRoundData();
        return getPriceInWeiDigitCount(uint256(answer));
    }

    function getDecimal() private view returns(uint8)
    {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(adr);
        return priceFeed.decimals();
    }

    function getPriceInWeiDigitCount(uint256 price) private view returns(uint256){
        uint8 decimalPlace = getDecimal();
        return price * (10 ** (18-decimalPlace));
    }

    function getConversionRate(uint256 amount) public view returns(uint256){
        uint256 price = getPrice();
        return (price * amount) / (10 ** 18); 
    }
}