pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FundTranche is Ownable, ERC20 {
    constructor(string memory fundName, string memory tranche)
        ERC20(
            string(abi.encodePacked(fundName, " ", tranche, "Fund Manager")),
            "FACT"
        )
        Ownable()
    {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(address from, uint256 amount) public returns (bool) {
        address burner = msg.sender;
        _spendAllowance(from, burner, amount);
        _burn(from, amount);
        return true;
    }
}
