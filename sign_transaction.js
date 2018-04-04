var Tx = require('ethereumjs-tx')
var privateKey = new Buffer('PUT_PRIVATE_KEY_HERE', 'hex')

var rawTx = {
  nonce: '0x00',
  gasPrice: '0x09184e72a000', 
  gasLimit: '0x2710',
  to: '0xbc11a269ab2d60e9616a80ff50f82af2d60f6d73', 
  value: '0x00', 
  data: '0x7f7465737432000000000000000000000000000000000000000000000000000000600057'
}

var tx = new Tx(rawTx)
tx.sign(privateKey)

var serializedTx = tx.serialize()
console.log(serializedTx.toString('hex'))
