// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Wallet {

    address payable public owner ;

    constructor(address payable _owner){
    owner = _owner;
}    

    function deposit() payable public {
 
}

    function sendEther(address payable to,uint amount) public {
    require(msg.sender == owner, "Sender is not allowed");
    to.transfer(amount);
}    

    function balanceOf() public view returns(uint) {
    return address(this).balance;
}    
}
