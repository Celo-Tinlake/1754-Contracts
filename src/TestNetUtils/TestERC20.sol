pragma solidity ^0.8.13;

import {ERC20PresetFixedSupply} from "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetFixedSupply.sol";

contract TestERC20 is ERC20PresetFixedSupply {
    constructor()
        ERC20PresetFixedSupply(
            "1754 Test Currency",
            "t1754",
            2**256 - 1,
            msg.sender
        )
    {}
}
