var Web3 = require('web3');


if (typeof web3 !== 'undefined')
{
    web3 = new Web3(web3.currentProvider);
}
  else 
  {
    web3 = new Web3(new Web3.providers.HttpProvider("https://rinkeby.infura.io/tPNyqnWI32IepQh2lrMf "));
  var transaction = web3.eth.getTransaction('0xd337645c73c5836c2fdcaf83097028b00ae7312b5d25c51b0a4e0062869384a5');
console.log(transaction);
transaction.then(function(result){
  console.log(result)
})
}
