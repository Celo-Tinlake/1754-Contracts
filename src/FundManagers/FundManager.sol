pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {Delegator} from "../Delegators/Delegator.sol";
import {FundTranche} from "./FundTranche.sol";
import {MicroLoanFactory} from "../Borrowers/MicroLoanFactory.sol";
import {LoanStructures} from "../Structures/LoanStructures.sol";

contract FundManager is Ownable {
    uint256 seniorApy; // given in ray (10^26)
    Delegator delegator;
    FundTranche junior;
    FundTranche senior;
    MicroLoanFactory loanFactory;
    uint256 riskThreshold;
    IERC20 depositToken;

    constructor(
        string memory _managerSymbol,
        uint256 _seniorApy,
        address _loanFactory,
        address _depositToken
    ) Ownable() {
        junior = new FundTranche(_managerSymbol, "j");
        senior = new FundTranche(_managerSymbol, "s");
        seniorApy = _seniorApy;
        loanFactory = MicroLoanFactory(_loanFactory);
        depositToken = IERC20(_depositToken);
        riskThreshold = 100000;

        depositToken.approve(address(loanFactory), 2**256 - 1);
    }

    function addDelegator(address _delegator) external onlyOwner {
        delegator = Delegator(_delegator);
    }

    function fundLoan(uint256 loanId) external {
        address borrower = loanFactory.getRequester(loanId);
        if (delegator.isApproved(borrower)) {
            uint256 toFill = loanFactory.getAmountLeftToFill(loanId);
            uint256 curBalance = depositToken.balanceOf(address(this));
            loanFactory.contribute(
                loanId,
                toFill > curBalance ? curBalance : toFill
            );
        }
    }

    function claimUnderlying(uint256 creditId) external {
        loanFactory.claimCredit(creditId);
    }

    // TODO: Actually implement senior / junior tranches
    function depositSenior(uint256 amount, address to) external {
        require(
            depositToken.transferFrom(msg.sender, address(this), amount),
            "Fund Manager: Transfer failed"
        );
        senior.mint(to, amount);
    }

    function depositJunior(uint256 amount, address to) external {
        require(
            depositToken.transferFrom(msg.sender, address(this), amount),
            "Fund Manager: Transfer failed"
        );
        junior.mint(to, amount);
    }

    function withdrawSenior(uint256 amount, address to) external {
        require(
            senior.burn(msg.sender, amount),
            "Fund Manager: Transfer failed"
        );
        depositToken.transfer(to, amount);
    }

    function withdrawJunior(uint256 amount, address to) external {
        require(
            junior.burn(msg.sender, amount),
            "Fund Manager: Transfer failed"
        );
        depositToken.transfer(to, amount);
    }
}
