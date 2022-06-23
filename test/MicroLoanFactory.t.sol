// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "ds-test/test.sol";
import {console} from "forge-std/console.sol";
import {stdStorage, StdStorage, Test} from "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";

import {Utils} from "./utils/Utilities.sol";

import {ERC20PresetFixedSupply} from "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetFixedSupply.sol";
import {MicroLoanFactory} from "../src/Borrowers/MicroLoanFactory.sol";
import {InterestModule} from "../src/Interest/InterestModule.sol";
import {LoanStructures} from "../src/Structures/LoanStructures.sol";

contract BaseSetup is DSTest {
    Vm internal vm;
    Utils internal utils;
    address payable[] internal users;

    address internal alice;
    address internal bob;

    function setUp() public virtual {
        utils = new Utils();
        users = utils.createUsers(5);
        vm = utils.vm();
        alice = users[0];
        vm.label(alice, "Alice");
        bob = users[1];
        vm.label(bob, "Bob");
    }
}

contract ContractTest is BaseSetup {
    ERC20PresetFixedSupply debtToken;
    MicroLoanFactory factory;
    InterestModule interestModule;

    function setUp() public override {
        BaseSetup.setUp();
        debtToken = new ERC20PresetFixedSupply(
            "test",
            "t",
            2**256 - 1,
            address(this)
        );
        interestModule = new InterestModule();
        factory = new MicroLoanFactory(
            address(debtToken),
            address(interestModule)
        );
        interestModule.rely(address(factory));
    }

    function makeLoan(uint256 amount, address requestor)
        internal
        returns (uint256)
    {
        vm.prank(requestor);
        factory.requestLoan(LoanStructures.LoanPurpose.OTHER, amount, 30 days);
        return factory.requestsByAddress(requestor);
    }

    function testRequestLoanFuzzing(uint256 loanAmount) public {
        uint256 expectedId = factory.IDs();

        uint256 actualId = makeLoan(loanAmount, address(this));
        assert(expectedId == actualId);
    }

    function testFulfillLoan() public {
        uint256 loanAmount = 100000;
        uint256 loanId = makeLoan(loanAmount, alice);
        uint256 balanceBefore = debtToken.balanceOf(alice);
        debtToken.approve(address(factory), loanAmount);
        factory.contribute(loanId, loanAmount);
        uint256 balanceAfter = debtToken.balanceOf(alice);
        assert((balanceAfter - balanceBefore) == loanAmount);
    }
}
