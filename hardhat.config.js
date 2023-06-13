// require('@nomicfoundation/hardhat-toolbox');
require('@nomiclabs/hardhat-waffle');
require("@nomiclabs/hardhat-etherscan");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.0",
  networks: {
    goerli: {
      url: 'Your Alchemy Link',
      accounts: ["Your Private Key"]
    },
  }
};

// 0x02f6A88fb1a445431034bdCE2E5531e5E13c1Ba8