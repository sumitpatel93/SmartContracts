var Web3 = require('web3');


if (typeof web3 !== 'undefined')
{
    web3 = new Web3(web3.currentProvider);
}
  else 
  {
    web3 = new Web3(new Web3.providers.HttpProvider("https://rinkeby.infura.io/tPNyqnWI32IepQh2lrMf "));
  var number = web3.eth.getTransactionCount('0x407d73d8a49eeb85d32cf465507dd71d507100c1');
console.log(number);
number.then(function(result){
  console.log(result)
})
}
