pragma solidity >=0.7.0 <0.9.0;

contract p2pExchange {


  address public owner;
  uint public usdToEur = 92*1e16; // rate of exchange form first(ex :- usd) to second(ex :- eur) currency
  uint public eurToUSD = 108*1e16;

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }


  function p2pExchangeAmount(uint amount,string memory exchangeTo) payable public returns (uint exhcangeAmount) {
    uint exchangeRate = eurToUSD ;
    if (keccak256(bytes(exchangeTo)) == keccak256(bytes("EUR"))) exchangeRate = usdToEur ;
    uint convertedAmount = amount * exchangeRate;

    return convertedAmount;
  }

  function updateEurToUSDRate(uint newRate) onlyOwner public returns (bool success) {
    eurToUSD  = newRate;
    return true;
  }

  function updateUsdToEurRate(uint newRate) onlyOwner public returns (bool success) {
    usdToEur = newRate;
    return true;
  }
}