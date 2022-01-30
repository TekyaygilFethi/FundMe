// SPDX-License-Integration: MIT

pragma solidity >=0.6.0 <0.9.0;

import './ConversionBase.sol';
import './RinkebyConversion.sol';
import './KovanConversion.sol';
import './ConversionOps.sol';
import './NetworkType.sol';

contract ConversionApp{
    ConversionBase conversionObject;
    uint conversionResult;

    constructor(NetworkType network) public {
        if(network == NetworkType.Rinkeby){
            createRinkebyObject();
        }else{
            createKovanObject();
        }
    }

    function createRinkebyObject() private {
        conversionObject = new RinkeByConversion();
    }

    function createKovanObject() private {
        conversionObject = new KovanConversion();
    }

    function getAddressByPair(string memory pair) public view returns(address){
        return conversionObject.getAddressByPair(pair);
    }

    function convert(uint256 amount) public returns(uint) { 
        address adr = getAddressByPair("ETH / USD");
        
        ConversionOps conversionOps = new ConversionOps(adr);
        conversionResult = conversionOps.getConversionRate(amount);
    }

    function getConversionValue() public view returns(uint){
        return conversionResult;
    }
}