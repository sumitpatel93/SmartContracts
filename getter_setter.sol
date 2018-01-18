pragma solidity ^0.4.17;
 contract HelloWorld {
    string public word = "Hello world";
    function getword() returns  (string){
        return word;
    }
    function setword(string newword) returns (string) {
        word = newword;
        return word;
    } 
     
 }