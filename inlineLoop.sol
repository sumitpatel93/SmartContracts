pragma solidity ^0.4.18;

contract Assembly {
    
    function nativeLoops() public returns (uint _r ) {
        for (uint i = 0; i<10; i++){
            _r++;
        }
    }
    
    function asemblysmLoops() public returns (uint _r) {
        assembly {
            let i := 10
            loop:
            i := add(i,1)
            _r := add(_r,1)
            jumpi(loop, lt(i,10))
        }
    }
    
    
    function nativeConditional(uint _v ) public returns (uint ){
        
        if (5== _v){
            return 55;
            
        } else if( 6 == _v){
            return 66;
        }
        return 11;
    }
}


//lt = 1 if a is less then b, 0 otherwise
//jumpi(label, condition)	–	jump to label if condition is nonzero
