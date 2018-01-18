pragma solidity ^0.4.19;
contract CheckIssuer {
    string word = "Hello Worlaaaad";
    address public issuer;
    
    function CheckIssuer() {
        issuer  = msg.sender;
    }
    
    modifier ifissuer(){
        if (issuer != msg.sender){
            throw;
        } else {
            _;
        }
    }
    function getword() constant returns(string) {
        return word;
    }
    
    function setword(string newword) ifissuer returns(string){
        word = newword;
        return "this is the creator of transaction";
    }
}