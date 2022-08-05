require("@nomiclabs/hardhat-waffle");

const ALCHEMY_API_KEY = "_zgNDEMQwJZpZeNadHD3b-fWseOAwGQq";
const MUMBAI_TESTNET_PVT_KEY = "e286a446b7b2babdaccd3cf39d2339f75391e8d73c9ffca1a77c8be5c16cda34";


module.exports = {
  solidity: "0.8.4",
  networks: {
    matic_testnet: {
      url: 'https://polygon-mumbai.g.alchemy.com/v2/_zgNDEMQwJZpZeNadHD3b-fWseOAwGQq',
      accounts: [`${MUMBAI_TESTNET_PVT_KEY}`]
    }
  }
};
