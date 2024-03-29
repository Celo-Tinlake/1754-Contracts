// SPDX-License-Identifier: ISC

pragma solidity ^0.8.10;

import "./IERC721Credit.sol";
import "../Structures/CreditorStructures.sol";
import "../Structures/LoanStructures.sol";
import "../Structures/MicroLoanEvents.sol";
import "./ERC721Credit.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface InterestModuleLike {
    function incDebt(uint256 loan, uint256 currencyAmount) external;

    function decDebt(uint256 loan, uint256 currencyAmount) external;

    function debt(uint256 loan) external view returns (uint256);

    function rateDebt(uint256 rate) external view returns (uint256);

    function setRate(uint256 loan, uint256 rate) external;

    function changeRate(uint256 loan, uint256 newRate) external;

    function accrue(uint256 loan) external;

    function newLoan(
        uint256 loan,
        uint256 ratePerSecond,
        uint256 fixedRate
    ) external;
}

contract MicroLoanFactory is LoanStructures, MicroLoanEvents, Ownable {
    mapping(uint256 => Loan) public loans;
    mapping(uint256 => LoanRequest) public requestsById;
    mapping(address => uint256) public requestsByAddress;
    mapping(address => uint256) public creditScores;
    mapping(address => bool) public attestors;
    uint256 public interestRate = 10**9; // 10% interest rate
    address public settlementToken;
    address public creditToken;
    uint256 public IDs;
    InterestModuleLike public interestModule;

    event AttestorAdded(address indexed attestor);
    event AttestorRemoved(address indexed attestor);

    constructor(address token, address _interestModule) Ownable() {
        settlementToken = token;
        IDs = 1;
        interestModule = InterestModuleLike(_interestModule);
        ERC721Credit credit = new ERC721Credit(address(this));
        creditToken = address(credit);
    }

    modifier loanExists(uint256 id) {
        require(loans[id].start > 0, "Loan does not exist");
        _;
    }

    modifier requestExists(uint256 id) {
        require(
            requestsById[id].borrower != address(0),
            "Request does not exist"
        );
        _;
    }

    modifier attestor(address addr) {
        require(attestors[addr], "Not an attestor");
        _;
    }

    function setCreditToken(address token) external onlyOwner {
        creditToken = token;
    }

    function getAmountOwed(uint256 id) public view returns (uint256) {
        if (loans[id].closed || loans[id].id == 0) {
            return 0;
        }

        return interestModule.debt(id);
    }

    function getRequester(uint256 id) external view returns (address) {
        return requestsById[id].borrower;
    }

    function getAmountLeftToFill(uint256 id) external view returns (uint256) {
        return requestsById[id].amount - requestsById[id].amountFilled;
    }

    function addAttestor(address newAttestor) external onlyOwner {
        require(!attestors[newAttestor], "Already an attestor");
        attestors[newAttestor] = true;

        emit AttestorAdded(newAttestor);
    }

    function removeAttestor(address toRemove)
        external
        onlyOwner
        attestor(toRemove)
    {
        attestors[toRemove] = false;

        emit AttestorRemoved(toRemove);
    }

    function attest(
        uint256 loanId,
        uint256 score,
        bytes calldata details
    ) external attestor(msg.sender) {
        creditScores[requestsById[loanId].borrower] = score;
        emit Attestation(loanId, msg.sender, score, details);
    }

    function requestLoan(
        LoanPurpose purpose,
        uint256 amount,
        uint256 duration
    ) external returns (uint256 loanId) {
        loanId = IDs;
        LoanRequest storage request = requestsById[IDs];
        request.amount = amount;
        request.borrower = msg.sender;
        request.purpose = purpose;
        request.duration = duration;

        requestsByAddress[msg.sender] = loanId;
        emit LoanRequested(
            IDs,
            msg.sender,
            block.timestamp,
            amount,
            interestRate
        );
        IDs++;
    }

    function _fulfillLoan(uint256 id) internal requestExists(id) {
        LoanRequest storage request = requestsById[id];
        require(
            loans[requestsByAddress[request.borrower]].start == 0 &&
                loans[id].start == 0,
            "User has an outstanding loan"
        );
        Loan storage loan = loans[id];
        loan.start = block.timestamp;
        loan.deadline = block.timestamp + request.duration;
        loan.id = id;
        loan.borrower = request.borrower;
        loan.purpose = request.purpose;
        loan.amount = request.amount;
        interestModule.newLoan(id, interestRate, interestRate);
        interestModule.incDebt(id, loan.amount);

        IERC20(settlementToken).transfer(request.borrower, request.amount);
        emit LoanFulfilled(
            id,
            block.timestamp,
            request.borrower,
            request.amount
        );
    }

    function contribute(uint256 id, uint256 amount) external returns (uint256) {
        LoanRequest storage request = requestsById[id];
        uint256 amountToFill = request.amount - request.amountFilled;
        uint256 fillAmount = amount > amountToFill ? amountToFill : amount;
        require(
            IERC20(settlementToken).transferFrom(
                msg.sender,
                address(this),
                fillAmount
            )
        );
        request.amountFilled += fillAmount;
        if (request.amountFilled == request.amount) {
            _fulfillLoan(id);
        }
        return
            IERC721Credit(creditToken).mint(
                CreditorStructures.CreditMintParams({
                    loanId: id,
                    amountSupplied: fillAmount,
                    creditor: msg.sender
                })
            );
    }

    function calculateInterest(uint256 id) internal view returns (uint256) {
        return interestModule.debt(id);
    }

    function closeLoan(uint256 id) internal {
        Loan storage loan = loans[id];
        loan.closed = true;
        uint256 elapsedTime = block.timestamp - loan.start;
        int256 creditChange = int256(block.timestamp) - int256(loan.start);
        creditScores[loan.borrower] =
            creditScores[loan.borrower] +
            block.timestamp -
            loan.start;
        emit LoanFullyPaid(
            id,
            block.timestamp,
            loan.borrower,
            loan.amount,
            elapsedTime,
            creditChange
        );
    }

    function repayLoan(uint256 id, uint256 amount) external {
        Loan storage loan = loans[id];
        interestModule.accrue(id);
        uint256 totalOwed = interestModule.debt(id);
        require(totalOwed > 0, "Does not owe anything");
        uint256 amountPaid = amount > totalOwed ? totalOwed : amount;
        loan.totalPaid += amountPaid;
        require(
            IERC20(settlementToken).transferFrom(
                loan.borrower,
                address(this),
                amountPaid
            )
        );
        interestModule.decDebt(id, amountPaid);
        if (amountPaid == totalOwed) {
            closeLoan(id);
        }
        emit LoanPaymentMade(
            id,
            block.timestamp,
            loan.borrower,
            amountPaid,
            totalOwed - amountPaid
        );
    }

    function claimCredit(uint256 creditId) external returns (uint256) {
        (
            CreditorStructures.Credit memory credit,
            address owner
        ) = IERC721Credit(creditToken).getCreditInfo(creditId);
        Loan storage loan = loans[credit.loanId];
        uint256 effectiveAmount = loan.totalPaid - credit.lastClaimedAt;
        uint256 entitledTo = (credit.amountSupplied * effectiveAmount) /
            loan.amount;

        credit.lastClaimedAt = loan.totalPaid;
        IERC721Credit(creditToken).setAmountClaimed(creditId, entitledTo);
        IERC20(settlementToken).transfer(owner, entitledTo);
        return entitledTo;
    }
}
