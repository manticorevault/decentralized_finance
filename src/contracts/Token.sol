pragma solidity >=0.6.0 <0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    address public minter;

    event MinterChanged(address indexed from, address to);

    constructor() public payable ERC20("Aethernum Coin", "AEC") {
        minter = msg.sender;
    }

    function changeMinter(address decFinance) public returns (bool) {
        require(msg.sender==minter, "Oops, apparently this is an illegal operation. Only the contract owner can change the minter.")

        minter = decFinance;

        emit MinterChanged(msg.sender, decFinance);
        return true;
    }

    function mintTokens(address account, uint256 amount) public {
        require(msg.sender==minter, "Oops, apparently this is an illegal operation. The sender doesn't have the proper role")
        
        _mint(account, amount);
    }
}