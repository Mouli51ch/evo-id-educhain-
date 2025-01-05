require('@nomiclabs/hardhat-ethers');
require('dotenv').config();

const { PRIVATE_KEY, OCID_API_KEY, INFURA_API_KEY } = process.env;

module.exports = {
  solidity: "0.8.0",
  networks: {
    opencampus: {
      url: `https://open-campus-codex-sepolia.drpc.org`, // Replace with your actual RPC URL if needed
      accounts: [`0x${PRIVATE_KEY}`]
    },
    goerli: {
      url: `https://goerli.infura.io/v3/${INFURA_API_KEY}`,
      accounts: [`0x${PRIVATE_KEY}`]
    }
  }
};
