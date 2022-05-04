pragma solidity ^0.4.17;

contract Lottery {

    address public manager;
    address[] public players;

    function Lottery() public {
        manager = msg.sender;
    }

    function enter() payable public {
        require(msg.value >= 0.01 ether); //, "You must enter the lottery with at least 0.01 ether")
        players.push(msg.sender);
    }

    function random() private view returns (uint) {
        return uint(keccak256(block.difficulty, now, players));
    }

    function pickWinner() public restricted {
         //Must be manager
        require(players.length > 0); //Must have players
        uint winnerId = random() % players.length;
        players[winnerId].transfer(this.balance);

        players = new address[](0);
    }

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }

}