//this will destroy after some time , in the time interval you cant destroy it.until its unlockced

pragma solidity ^0.4.18;

contract Lock {
  address owner;
  uint unlockTime;

  function Lock(uint _unlockTime) public {
    owner = msg.sender;
    unlockTime = _unlockTime + now;
  }

  function isUnlocked() view public returns (bool) {
     
    return now >= unlockTime;
  }

  modifier onlyOwner() { require(msg.sender == owner); _; }
  modifier onlyWhenUnlocked() { require(isUnlocked()); _; }

  function destroy() public  onlyWhenUnlocked  {
        selfdestruct(owner);
  }
   function getTime() view public returns (uint) {
    return now;
  }
}
