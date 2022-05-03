//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.6;

contract sendmoney {

    uint public balancereceive;

    function receivemoney() public payable {
        balancereceive = msg.value;
    }

    function getbalance() public view returns(uint){
        return address(this).balance;
    }

    function withdrawmoney() public payable{
        address payable to = payable(msg.sender);
        to.transfer(this.getbalance());
    }

    function withdrawmoneyto(address payable _to) public {
        _to.transfer(this.getbalance());
    }
}