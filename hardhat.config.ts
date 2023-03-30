import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import dotenv from "dotenv";
dotenv.config();
const config: HardhatUserConfig = {
  solidity: "0.8.9",

  networks: {
    hardhat: {
    },
    sepolia: {
      url: process.env.SEPOLIA_RPC,
      //@ts-ignore
      accounts:[process.env.PRIVATE_KEY]},
  },
  etherscan: {
    apiKey: process.env.API_KEY,
  }
};
export default config;