
const hre = require("hardhat");

async function main() {


  const Hotel = await hre.ethers.getContractFactory("HotelManagement");
  
  const hotel = await Hotel.deploy(50, 100);

  await hotel.deployed();

  console.log(
    `Hotel has been deployed`, hotel.address 
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

//0x02f6A88fb1a445431034bdCE2E5531e5E13c1Ba8

//0xE38CF6dD8cB829756762C13F4139e2d901353Ea1