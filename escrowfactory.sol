pragma solidity ^0.4.17;

contract EscrowFactory {
    event EscrowCreated(address newAddress);

    function EscrowFactory() public {

    }

    function createEscrow(address seller) public payable {
        address a = address((new Escrow).value(msg.value)(seller));
        EscrowCreated(a);
    }
}

contract Escrow {
    uint public createdAt;
    address public buyer;
    address public seller;

    uint public buyerOk; // 0: undecided, 1: accept, 2: reject
    uint public sellerOk;

	function Escrow(address _seller) public payable {
        createdAt = now;

        buyer = msg.sender;
        seller = _seller;
    }

    function accept() public {
        if (msg.sender == buyer) {
            buyerOk = 1;
        }

        if (msg.sender == seller) {
            sellerOk = 1;
        }
    }

    function reject() public {
        if (msg.sender == buyer) {
            buyerOk = 2;
        }

        if (msg.sender == seller) {
            sellerOk = 2;
        }
    }
}
