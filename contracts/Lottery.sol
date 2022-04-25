pragma solidity ^0.4.17;

contract Lottery {

    address public manager;
    address[] public players;

    function Lottery() public {
        manager = msg.sender;
    }

    function enter() payable public {
        require(msg.value >= 0.01 ether, "You must enter the lottery with at least 0.01 ether");
        players.push(msg.sender);
    }

}