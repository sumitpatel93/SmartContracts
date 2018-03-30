var Web3 = require('web3');

if (typeof web3 !== 'undefined'){ 

    web3 = new Web3(web3.currentProvider);
}
else{

web3 =  new Web3(new Web3.providers.HttpProvider("https://rinkeby.infura.io/tPNyqnWI32IepQh2lrMf "));
web3.eth.estimateGas({
    to: "0x11f4d0A3c12e86B4b5F39B213F7E19D048276DAe",
    data: "0xc6888fa10000000000000000000000000000000000000000000000000000000000000003"
})
.then(console.log);


}
