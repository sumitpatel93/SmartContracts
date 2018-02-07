pragma solidity ^0.4.19;

contract product_details{

  struct details  {
    uint price;
    string name;
    string item_id;
    bool isSold;
  }
    
    mapping (address => details ) product_mapping;
    address[] public product_accts;
    
    function setproducts(address _address, uint  _price , string  _name , string _item_id, bool _isSold) public {
        var product = product_mapping[_address];
        product.price = _price;
        product.item_id = _item_id;
        product.name = _name;
        product.isSold = _isSold;
        
        product_accts.push(_address)-1;
    }
    
    function getProductAddress() view public returns (address[]){
      return product_accts;        
        }
    function countProductAccnts() view public returns (uint) {
        return product_accts.length;
    }    
   
    
}
