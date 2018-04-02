pragma solidity ^0.4.8;

contract RevenueSharing {
    address public creator;
    mapping(uint => address) public shareholders;
    uint public numShareholders;
    
    event Disburse(uint _amount, uint _numShareholders);
    
    function RevenueSharing(address[] addresses) {
        creator = msg.sender;
        numShareholders = addresses.length;
        for (uint i=0; i< addresses.length; i++) {
            shareholders[i] = addresses[i];
        }
    }
    
    function shareRevenue() payable returns (bool success)  {
        uint amount = msg.value / numShareholders;
        for (uint i=0; i<numShareholders; i++) {
            if (!shareholders[i].send(amount)) revert();
        }
        Disburse(msg.value, numShareholders);
        return true;
    }
    
    function kill() {
        if (msg.sender == creator) selfdestruct(creator);
    }
}
