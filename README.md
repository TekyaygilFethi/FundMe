
# Fund Me

Fund Me is a Solidity project that allows users to receive and withdraw received funds. 

Users can fund to the contract owner any amount of ETH higher than the fund threshold which can be set by the contract owner only.

There are some restrictions about funding process:

    1. Contract owner can't fund to itself
    2. User can't fund less than the minimum threshold which can be set only by the contract owner

For this project, [Currency Converter project](https://github.com/TekyaygilFethi/CurrencyConverter) codes are used with small differences to fit the scenario.



## Demonstration

Fund Me.sol file must be compiled and deployed for the project to work. Here, FundMe constructor has this line to create the relevant object with the network you're on.

```solidity
  cApp = new ConversionApp(NetworkType.Rinkeby);
```

This line creates the object that will work for Rinkeby Network. If you want to work on Kovan Network, you must changes this line into:

```solidity
  cApp = new ConversionApp(NetworkType.Kovan);
```
Since NetworkType is an enum, you can choose one of these 2 types:

```solidity
  enum NetworkType{
    Rinkeby,
    Kovan
}
```
### Seeing the Minimum USD Threshold
To see the minimum threshold for funding, you can use minimumUSDThreshold variable to see this value. This threshold is 0 by default at the beginning. Only the contract owner can change this value.

![Seeing The Minimum USD Threshold](https://res.cloudinary.com/dpzdg2rik/image/upload/v1643562017/samples/FundMeSolidity/threshold.png)


### Fund 
To fund to the contract owner, you must set a value in terms of corresponding chosen currency (Wei, Gwei, Finney, ETH). 
![Currencies For Transaction](https://res.cloudinary.com/dpzdg2rik/image/upload/v1643560239/samples/FundMeSolidity/currenciesfortransaction.png)


After entering amount and choosing desired currency for fund, you can use fund function to fund your money. Please note that the USD equivalent of your sent amount must be higher that the threshold which is also the type of USD. This threshold is the type of dollars.

![Fund](https://res.cloudinary.com/dpzdg2rik/image/upload/v1643560577/samples/FundMeSolidity/fund.png)

If you are not funding to your own contract and your amount's USD equivalent is higher than threshold then the transaction will be successful.


### Seeing the Owner
Owner is the address which will gain the fund. To see the owner, you should call owner function.

![Seeing The Owner](https://res.cloudinary.com/dpzdg2rik/image/upload/v1643561182/samples/FundMeSolidity/owner.png)


### Setting the Minimum Threshold (Contract Owner Only)

This function can be called only by the contract owner. If any unauthorized accounts tries to execute this code, they will get error.

To set the USD equivalent of the minimum threshold use setMinimumUSDThreshold methods with desired parameter.

![Setting the Minimum Threshold](https://res.cloudinary.com/dpzdg2rik/image/upload/v1643561440/samples/FundMeSolidity/setMinimumUSDThreshold.png)


### Withdrawing the Funds (Contract Owner Only)

To withdraw all the funds, you must execute withdraw function. Once you execute this function and accept the Withdraw operation, then all the balance of this contract should be transferred to your wallet.

![Withdrawing](https://res.cloudinary.com/dpzdg2rik/image/upload/v1643561810/samples/FundMeSolidity/withdraw.png)


### Seeing All the Funders and Their Funds (Contract Owner Only)
To see all the funders to the contract and the fund amounts, call seeAllFundsAndFunders function.
![Seeing All Funders and Their Funds](https://res.cloudinary.com/dpzdg2rik/image/upload/v1643562686/samples/FundMeSolidity/seeallfunds.png)
 
You can match the funders and their funds according to their order. For example address 0xABdeE0BF5dF1049c1a6EB74a0aEeF6E353F3D916 (address[] index 0) funded 20000000000000000 (uint256[] index 0) to the contract. Samewise, 
address 0x7e1a8502a8AbaC18618921572edAD1A43aE3Cc24 (address[] index 1) funded 20000000000000000 (uint256[] index 1) to the contract.



## ! You can use https://eth-converter.com/ website to convert between the ETH-WEI-GWEI





# And you're done! Congratulations!