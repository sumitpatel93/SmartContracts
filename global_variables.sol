pragma solidity ^0.4.19 ;
contract HelloWorldConract{

    string word = "Hello World";
    address public issuer;
    address public CoinBase ;
    uint256 public blocknumber;
    uint256 public blockdifficulty;
    uint256 public timestamp;
    uint256 public Gp;
    
    function HelloWorldConract (){
        issuer  = msg.sender;
        CoinBase  = block.coinbase;
        blocknumber = block.number;
        blockdifficulty = block.difficulty;
        timestamp = block.timestamp;
        Gp = tx.gasprice;
    }
  
}