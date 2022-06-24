pragma solidity ^0.8.13;

contract DelegatorWhitelistAll {
    function isApproved(address beneficiary) external view returns (bool) {
        return true;
    }
}
