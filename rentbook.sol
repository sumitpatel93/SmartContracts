pragma   solidity ^0.4.18;
contract   LibraryService{
address public owner;
uint public regAmount;
uint public   balance;
struct UserDetail{
address userId;
bytes32 userName;
uint regAmount;
}
struct BookDetail{
uint bookId;
bytes32 bookName;
uint rentPrice;
bool isRented;
}
struct RentDetail{
uint bookId;
address rentedBy;
uint rentDate;
uint returnDate;
}
mapping(uint=>BookDetail) public   booksData;
mapping(address=>UserDetail) public   usersData;
mapping(address=>RentDetail[]) public   rentData;
event Register (address _userId);
event Rent (address _rentedBy, uint   _bookId);
event Return (address _rentedBy, uint   _bookId);
function LibraryService (uint _regAmount,   uint[] _bookIds, bytes32[] _bookNames, uint[]   _rentPrices)public {
owner = msg.sender;
regAmount =   _regAmount;
for (uint i=0;   i<_bookIds.length; i++){
booksData[_bookIds[i]]=BookDetail({bookId:   _bookIds[i],
bookName:   _bookNames[i], rentPrice: _rentPrices[i],
isRented:   false
});
}
}
function registerUser(bytes32 _userName)public returns (bool success){
if(msg.value<regAmount) {return   false;}
balance = balance + msg.value;
usersData[msg.sender]=UserDetail({userId:   msg.sender, userName: _userName, regAmount:   msg.value});
emit Register(msg.sender);
return true;
}
function rentBook(uint _bookId, uint   _rentDate, uint _returnDate)
public returns (bool success){
if(usersData[msg.sender].regAmount>0) return false;
if(msg.value<booksData[_bookId].rentPrice)   return false;
rentData[msg.sender].push(RentDetail({
bookId:   _bookId,rentedBy:   msg.sender,rentDate:   _rentDate, returnDate:   _returnDate }));
booksData[_bookId].isRented   = true;
balance = balance + msg.value;
emit Rent (msg.sender,   _bookId);
return true;
}
function returnBook(uint _bookId) public   returns (bool success){
if(booksData[_bookId].isRented==false) return false;
bool stat=false;
for(uint i=0;i<rentData[msg.sender].length;i++){
if(rentData[msg.sender][i].bookId==_bookId){
stat = true;
break;
}
}
if(stat==false) return   false;
booksData[_bookId].isRented = false;
returnBook (msg.sender, _bookId);
return true;
}
function getBookById(uint _bookId) public   returns (bytes32 _bookName, uint _rentPrice,bool _isRented){
return (booksData[_bookId].bookName, booksData[_bookId].rentPrice ,booksData[_bookId].isRented);
}
function destroy() public {
if(owner==msg.sender){
suicide(owner);
}
}
}
