pragma solidity ^0.4.19;

contract Calculator {
   
    function add (uint x, uint y)  returns (uint z){
        z= x+y;
      
    }
    function substract (uint x, uint y) returns (uint s){
        s = x-y;
    }
    
    function multiply (uint x, uint y) returns (uint z ){
        z = x*y;
    }
    
    function division (uint x ,uint y ) returns (uint z){
        z = x/y;
    }
}
    
