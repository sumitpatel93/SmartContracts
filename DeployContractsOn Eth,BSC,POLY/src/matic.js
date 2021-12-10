require('dotenv').config()
var cors = require('cors');
var express = require('express');
const Tx = require('ethereumjs-tx')
const Key = require('../config/keys')
var Web3 = require("web3");
const app = express();


app.use(cors());
// middleware
app.use(express.json());
app.use(express.urlencoded());

//set url of node as provider
var web3;
if (typeof web3 !== "undefined") {
  web3 = new Web3(web3.currentProvider);
} else {
  web3 = new Web3(new Web3.providers.HttpProvider("https://rpc-mumbai.maticvigil.com/"));

}

// check the current block number and network type
web3.eth.getBlockNumber().then(console.log);
web3.eth.net.getNetworkType()
  .then(console.log);


  app.post('/createKeys', async (req, res) => {
    const account = web3.eth.accounts.create();
    console.log(account);
    
    try {
      var publicKey = account.address;
      var privateKey = account.privateKey;

      res.status(200).json({publicKey, privateKey});
    }
    catch (e) {
      console.log(e)
      res.status(500).json({ Body: e })
    }
  })



app.post('/saveWatch', async (req, res) => {
  try {


    const ownerName = req.body.ownerName;
    const watchInsured = req.body.watchInsured;
    const dateOfLoss = req.body.dateOfLoss
    const cityOfLoss = req.body.cityOfLoss
    const lossDescription = req.body.lossDescription;
    const brand = req.body.brand;
    const model = req.body.model
    const serialNumber = req.body.serialNumber;
    const description = req.body.description;
    const material = req.body.material
    const filePath = req.body.filePath

    const userPvtKey = req.body.senderPrivateKey
    const pvtKey = userPvtKey.substring(2)
    var privateKey = new Buffer(pvtKey, 'hex');

    //web3.eth.defaultAccount = senderAddress;

    var contractInstance = new web3.eth.Contract(
      Key.interface,
      Key.contractAddress
    );
    var encodedABI = contractInstance.methods.saveWatchDetails(
      ownerName,
      watchInsured,
      dateOfLoss,
      cityOfLoss,
      lossDescription,
      brand,
      model,
      serialNumber,
      description,
      material,
      filePath
    ).encodeABI()

    const nonce = await web3.eth.getTransactionCount("0x655e5cB1F1EABE2767EFEd4E90714D2A92608d15");
    

    var rawTx = {
      nonce: web3.utils.toHex(nonce),
      from: "0x655e5cB1F1EABE2767EFEd4E90714D2A92608d15",
      to:   Key.contractAddress,
      gasLimit: '0x3d0900',
      gasPrice: web3.utils.toHex(web3.utils.toWei('30', 'gwei')),
      chainId: web3.utils.toHex(80001),
      data: encodedABI,
    };

    //var tx = new Tx(rawTx, { 'chain': 'smart-chain' });
    var tx = new Tx(rawTx, { 'chain': 'Mumbai Testnet' });
    tx.sign(privateKey);
    var serializedTx = tx.serialize();

    web3.eth.sendSignedTransaction('0x' + serializedTx.toString('hex'), function (err, hash) {
      console.log(err)
      if (err) {
        res.status(500).json({
          Body: err
        })
      }
      else {
        res.status(200).json({
          status: true,
          message: "Action Completed Successfully",
          data: hash
        })
      }
    });
  }
  catch (e) {
    console.log(e)
    res.status(400).json({
      status: e
    })
  }
})

app.get('/getData', async (req, res) => {
  var contractInstance = new web3.eth.Contract(
    Key.interface,
    Key.contractAddress
  );

  try {
    contractInstance.methods.getNumberOfWatches().call().then(async result => {
      res.status(200).json({ Message: "Success", Body: result })
    })
  }
  catch (e) {
    console.log(e)
    res.status(500).json({ Body: e })
  }
})


app.post('/getWatchData', async (req, res) => {
  const watchNumber = req.body.watchNumber
  var contractInstance = new web3.eth.Contract(
    Key.interface,
    Key.contractAddress
  );
  try {
    contractInstance.methods.watches(watchNumber).call().then(async result => {
      res.status(200).json({ Message: "Success", Body: result })
    })
  }
  catch (e) {
    res.status(500).json({ Body: e })
  }
})

app.post('/searchByName', async (req, res) => {
  const name = req.body.name;
  var contractInstance = new web3.eth.Contract(
    Key.interface,
    Key.contractAddress
  );

  try {
    contractInstance.methods.searchByName(name).call().then(async result => {
      res.status(200).json({ Message: "Success", 
      ownerName: result[0],
      watchInsured : result[1],
      dateOfLoss : result[2],
      cityOfLoss : result[3],
      lossDescription : result[4],
      brand : result[5],
      model : result[6],
      serialNumber : result[7],
      description : result[8],
      material : result[9],
      filePath : result[10]
      
    })
    })
  }
  catch (e) {
    console.log(e)
    res.status(500).json({ Body: e })
  }
})


app.post('/setWatchStatus', async (req, res) => {
  try {

    const status = req.body.status;
    const watchSerialNumber = req.body.watchSerialNumber;
    
    const userPvtKey = req.body.senderPrivateKey
    const pvtKey = userPvtKey.substring(2)
    var privateKey = new Buffer(pvtKey, 'hex');

    //web3.eth.defaultAccount = senderAddress;

    var contractInstance = new web3.eth.Contract(
      Key.interface,
      Key.contractAddress
    );
    var encodedABI = contractInstance.methods.setwatchStatusByserialNumber(
      watchSerialNumber,status
    ).encodeABI()

    const nonce = await web3.eth.getTransactionCount("0x655e5cB1F1EABE2767EFEd4E90714D2A92608d15");
    
    var rawTx = {
      nonce: web3.utils.toHex(nonce),
      from: "0x655e5cB1F1EABE2767EFEd4E90714D2A92608d15",
      to: Key.contractAddress ,
      gasLimit: '0x3d0900',
      gasPrice: web3.utils.toHex(web3.utils.toWei('30', 'gwei')),
      chainId: web3.utils.toHex(80001),
      data: encodedABI,
    };

    //var tx = new Tx(rawTx, { 'chain': 'smart-chain' });
    var tx = new Tx(rawTx, { 'chain': 'Mumbai Testnet' });
    tx.sign(privateKey);
    var serializedTx = tx.serialize();

    web3.eth.sendSignedTransaction('0x' + serializedTx.toString('hex'), function (err, hash) {
      console.log(err)
      if (err) {
        res.status(500).json({
          Body: err
        })
      }
      else {
        res.status(200).json({
          status: true,
          message: "Action Completed Successfully",
          data: hash
        })
      }
    });
  }
  catch (e) {
    console.log(e)
    res.status(400).json({
      status: e
    })
  }
})

app.post('/getWatchStatusBySerialNum', async (req, res) => {
  const number = req.body.serialNumber;
  var contractInstance = new web3.eth.Contract(
    Key.interface,
    Key.contractAddress
  );

  try {
    contractInstance.methods.watchStatusByserialNumber(number).call().then(async result => {
      res.status(200).json({ Message: "Success", 
      watchStatus : result
    })
    })
  }
  catch (e) {
    console.log(e)
    res.status(500).json({ Body: e })
  }
})

app.post('/transferWatch', async (req, res) => {
  try {

    const address = req.body.newOwnerAddress;
    const number = req.body.serialNumber;
    
    const userPvtKey = req.body.senderPrivateKey
    const pvtKey = userPvtKey.substring(2)
    var privateKey = new Buffer(pvtKey, 'hex');

    //web3.eth.defaultAccount = senderAddress;

    var contractInstance = new web3.eth.Contract(
      Key.interface,
      Key.contractAddress
    );
    var encodedABI = contractInstance.methods.transferWatch(
      address,number
    ).encodeABI()

    const nonce = await web3.eth.getTransactionCount("0x655e5cB1F1EABE2767EFEd4E90714D2A92608d15");
    
    var rawTx = {
      nonce: web3.utils.toHex(nonce),
      from: "0x655e5cB1F1EABE2767EFEd4E90714D2A92608d15",
      to: Key.contractAddress ,
      gasLimit: '0x3d0900',
      gasPrice: web3.utils.toHex(web3.utils.toWei('30', 'gwei')),
      chainId: web3.utils.toHex(80001),
      data: encodedABI,
    };

    //var tx = new Tx(rawTx, { 'chain': 'smart-chain' });
    var tx = new Tx(rawTx, { 'chain': 'Mumbai Testnet' });
    tx.sign(privateKey);
    var serializedTx = tx.serialize();

    web3.eth.sendSignedTransaction('0x' + serializedTx.toString('hex'), function (err, hash) {
      console.log(err)
      if (err) {
        res.status(500).json({
          Body: err
        })
      }
      else {
        res.status(200).json({
          status: true,
          message: "Action Completed Successfully",
          data: hash
        })
      }
    });
  }
  catch (e) {
    console.log(e)
    res.status(400).json({
      status: e
    })
  }
})

app.listen(3000, () =>
  console.log('App listening on port 3000'),
);


