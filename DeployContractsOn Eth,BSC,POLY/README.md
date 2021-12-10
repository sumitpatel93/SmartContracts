### Overview
This repo helps you with deploying and interacting with smart contracts on the 3 different blockchains.
1. Ethereum Blockchain ( Testnet )
2. Polygon Blockchain ( Testnet )
3. Binance Blockchain ( Testnet )


### How to initiate the repo

1. Clone the repo with the following command
    ``` git clone <repo>```

2. Install necessary dependencies
    ``` npm i```

### Deploying smart contracts on the 3 different blockchains

1. Compile the smart contracts written inside the contracts folder. With every change in smart contract you should compile it again and then migrate it to any network.
    ``` truffle compile ```

2. To deploy on ethereum blockchain
    ``` truffle migrate --network rinkeby```

3. To deploy on Polygon blockchain
    ``` truffle migrate --network matic```

4. To deploy on Binance blockchain
    ``` truffle migrate --network bscTestnet```

With each deployment it generates a new build for that particular blockchain. In order to interact with smart contract deployed , you shall replace the parameters inside keys.js from build file.

1. Update `contractAddress` with the latest contract address which is deployed on the blockchain.

2. Update `interface` with the latest one from the build file ( watchContract.json in this example ).

3. Update `bytecode` with the latest one deployed on the blockchain.

### Key Outcomes
| Blockchain | Deployment Cost  | Gas Used  | USD Price | Transaction Hash 
| :-----: | :-: | :-: | :-: | :-: |
| Ethereum | 0.02476813 ETH | 2476813 | $59.0 | 0xdb9a8628d3ed979e80ceaffe1009b888a2b6c3ea2febbc0868e38109bdd8b4ef
| Polygon | 0.02476813 ETH | 2476813 | $0.06 | 0xf9605709a73243fca0552d6f12640b0c596304b1015c4318fee664f7359bd797 
| Binance Chain | 0.02476813 ETH | 2476813 | $14.33 | 0x5050c697a519b34f4d3a3e24f147e0cc1f48818b4f2f746933149745dc0955ff


** Reading data from blockchain cost 0 fee