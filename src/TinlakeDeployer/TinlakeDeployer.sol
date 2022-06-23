pragma solidity ^0.8.13;

import "@1754-factory/tinlake/src/root.sol";
import {LenderDeployer} from "@1754-factory/tinlake/src/lender/deployer.sol";
import {BorrowerDeployer} from "@1754-factory/tinlake/src/borrower/deployer.sol";

import {TrancheFab} from "@1754-factory/tinlake/src/lender/fabs/tranche.sol";
import {MemberlistFab} from "@1754-factory/tinlake/src/lender/fabs/memberlist.sol";
import {ReserveFab} from "@1754-factory/tinlake/src/lender/fabs/reserve.sol";
import {AssessorFab} from "@1754-factory/tinlake/src/lender/fabs/assessor.sol";
import {PoolAdminFab} from "@1754-factory/tinlake/src/lender/fabs/pooladmin.sol";
import {CoordinatorFab} from "@1754-factory/tinlake/src/lender/fabs/coordinator.sol";
import {OperatorFab} from "@1754-factory/tinlake/src/lender/fabs/operator.sol";

import {ShelfFab} from "@1754-factory/tinlake/src/borrower/fabs/shelf.sol";
import {PileFab} from "@1754-factory/tinlake/src/borrower/fabs/pile.sol";
import {TitleFab} from "@1754-factory/tinlake/src/borrower/fabs/title.sol";

import "@openzeppelin/contracts/access/Ownable.sol";

contract TinlakeDeployer is Ownable {}
