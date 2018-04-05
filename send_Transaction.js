var Web3 =  require('web3')

if (typeof web3 !== 'undefined'){

}
else{
 web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
}

web3.eth.sendTransaction({
  from:"0xf7702019a914385356b52c568aa8819e4b7539c3",
  to:"0x2ae4c85220ac1e7ee6e3e1df7dafc795e94ba264",
  value:"1000000000000000000"

}, function(err, transactionHash){
    if(err){
           console.log(err);
  } else {
   console.log(transactionHash);
 }
 });
