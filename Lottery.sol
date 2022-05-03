//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.5.0 < 0.9.0;

  contract lottery
{   
    address payable public manager;
    address payable[] public participants;
    int public age=19;

    constructor()
    {
        manager = payable(msg.sender);
    }

    receive() external payable
    {
        if(age>18)
        {
        require(msg.value == 1 wei);
        }
        participants.push(payable(msg.sender));
    }

    function getbalance() public view returns(uint)
    {
        require(msg.sender == manager);
        return address(this).balance;
    }

    function random() public view returns(uint)
    {
        return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,participants.length)));
    }
    
    function winnerselect() public 
    {
        require(msg.sender == manager);
        require(participants.length >= 10);   
        uint r = random();
        uint index = r % participants.length;
        address payable winner;
        winner = participants[index];
        winner.transfer(getbalance());
        participants = new address payable[](0);
    }
}