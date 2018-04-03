pragma solidity ^0.4.18;

contract ArrayLength{
    uint[] public myArray;
    
    function ArrayLength() public{
        myArray.push(1);
        myArray.push(23);
        myArray.push(122);
        myArray.push(122);
    }
    
    function getArrayLength() public returns (uint) {
        return myArray.length;
    }
    
    
    function firstElement() public returns (uint){
        return myArray[0];
    }
    
    function getFullArray() public returns (uint[]){
        return myArray;
    }
    
}
