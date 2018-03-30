var Web3 = require('web3');


if (typeof web3 !== 'undefined')
{
    web3 = new Web3(web3.currentProvider);
   
}
  else 
  {
       
    web3 = new Web3(new Web3.providers.HttpProvider("https://rinkeby.infura.io/tPNyqnWI32IepQh2lrMf "));
  var info = web3.eth.getBlock(2100);
console.log(info);
info.then(function(result){
  console.log(result)
})
}
