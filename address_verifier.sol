pragma solidity ^0.4.18;
contract Verifier {
    function recoverAddr(bytes32 msgHash, uint8 v, bytes32 r, bytes32 s) returns (address) {
        return ecrecover(msgHash, v, r, s);
    }
    
    function isSigned(address _addr, bytes32 msgHash, uint8 v, bytes32 r, bytes32 s) returns (bool) {
        return ecrecover(msgHash, v, r, s) == _addr;
    }
}
//The code above creates a Verifier contract with the recoverAddr and isSigned functions.
//The latter will return an address. Requiring you as a developer to validate, outside of Solidity, that the address is correct.
