pragma solidity ^0.8.13;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract MockShelf {
    // Mocks the tinlake shelf contract, to facilitate credit delegation
    // Not optimized in any way

    mapping(uint256 => uint256) loanAmounts;
    mapping(uint256 => uint256) balances;

    mapping(uint256 => address) creditOwners;
    mapping(uint256 => address) registries;
    mapping(uint256 => uint256) registryTokenId;
    mapping(bytes32 => uint256) registryLookup;
    IERC20 loanToken;
    uint256 numLoans;

    event Close(uint256 indexed loan);
    event Issue(address indexed registry_, uint256 indexed token_);
    event Borrow(uint256 indexed loan, uint256 currencyAmount);
    event Withdraw(uint256 indexed loan, uint256 currencyAmount, address usr);
    event Repay(uint256 indexed loan, uint256 currencyAmount);

    modifier owner(uint256 creditId) {
        require(
            creditOwners[creditId] == msg.sender,
            "MockShelf: Not the owner of this credit line"
        );
        _;
    }

    function issue(address registry, uint256 token) external returns (uint256) {
        bytes32 nft = keccak256(abi.encodePacked(registry, token));
        require(registryLookup[nft] == 0, "nft-in-use");
        uint256 loan = ++numLoans;
        registryLookup[nft] = numLoans;
        creditOwners[loan] = msg.sender;
        registries[loan] = registry;
        registryTokenId[loan] = token;

        emit Issue(registry, token);
        return loan;
    }

    function close(uint256 loanId) external owner(loanId) {
        emit Close(loanId);
    }

    function borrow(uint256 loanId, uint256 amount) external owner(loanId) {
        loanAmounts[loanId] = loanAmounts[loanId] + amount;
        balances[loanId] = balances[loanId] + amount;
        emit Borrow(loanId, amount);
    }

    function withdraw(
        uint256 loan,
        uint256 amount,
        address to
    ) external owner(loan) {
        require(balances[loan] >= amount, "withdraw-amount-too-high");
        balances[loan] = balances[loan] - amount;

        require(loanToken.transfer(to, amount), "currency-trasnfer-failed");
        emit Withdraw(loan, amount, to);
    }

    function repay(uint256 loanId, uint256 amount) external owner(loanId) {
        require(balances[loanId] == 0, "withdraw-required-before-repay");

        require(
            loanToken.transferFrom(msg.sender, address(this), amount),
            "currency-transfer-failed"
        );
        loanAmounts[loanId] = loanAmounts[loanId] - amount;

        emit Repay(loanId, amount);
    }
}
