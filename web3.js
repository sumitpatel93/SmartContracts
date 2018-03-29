var Web3 = require('web3');


if (typeof web3 !== 'undefined')
{
    web3 = new Web3(web3.currentProvider);
   
}
  else 
  {
       
    web3 = new Web3(new Web3.providers.HttpProvider("https://rinkeby.infura.io/tPNyqnWI32IepQh2lrMf "));
  var version = web3.version.network;
console.log(version);
version.then(function(result){
  console.log(result)
})
}


