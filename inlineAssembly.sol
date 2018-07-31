pragma solidity ^0.4.11;
contract Cont {
    uint c;
    function func(uint a) returns (uint b) {
        assembly {
            b := mul(a, sload(c_slot)) // the offset is ignored, it is zero
        }
    }
}
