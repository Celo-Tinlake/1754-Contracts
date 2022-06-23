pragma solidity ^0.8.13;

import "@1754-factory/tinlake/src/borrower/shelf.sol";
import "@1754-factory/tinlake/src/lender/operator.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PermissionedBorrower is Ownable {}
