pragma solidity ^0.4.8;

contract Parent {

  // index of created contracts

  address[] public contracts;

  // useful to know the row count in contracts index

  function getContractCount() 
    public
    constant
    returns(uint contractCount)
  {
    return contracts.length;
  }

  // deploy a new contract

  function newCookie()
    public
    returns(address newContract)
  {
    Child c = new Child();
    contracts.push(c);
    return c;
  }
}


contract Child {

  // suppose the deployed contract has a purpose

  function getFlavor()
    public
    pure
    returns (string flavor)
  {
    return "mmm ... chocolate chip";
  }    
}
