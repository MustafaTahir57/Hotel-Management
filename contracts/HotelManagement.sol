//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract HotelManagement{

    // Define the state variables

    address owner;
    uint totalRooms;
    uint availableRooms;
    uint roomPrice;

    // Constructor function

    constructor (uint _totalRooms , uint _roomPrice) {
        owner = msg.sender;
        totalRooms = _totalRooms;
        availableRooms = _totalRooms;
        roomPrice = _roomPrice;
    }

   
   // Define the modifier here
   
   modifier checkAvailability(uint _numberofRooms){
       require(availableRooms>= _numberofRooms, "Not enough availabilty of rooms");
       _;
   }

   // Event
   event RoomBooked(address indexed _guest, uint _numberofRooms);

   // define the function of book rooms

   function bookRooms(uint _numberofRooms) public checkAvailability(_numberofRooms) payable{
       require(msg.value == roomPrice * _numberofRooms , "Not enough paid");
       availableRooms -= _numberofRooms;
       emit RoomBooked(msg.sender , _numberofRooms);
   }

   function getAvailableRooms() public view returns(uint) {
       return availableRooms;
   }

   function getTotalRooms() public view returns(uint) {
       return totalRooms;
   }

   function getRoomPrice() public view returns(uint) {
       return roomPrice;
   }

   function withdrawFunds() public {
       require(msg.sender == owner , "Only Owner can call this function");
       uint balance = address(this).balance;
       payable(msg.sender).transfer(balance);
   }

   
}