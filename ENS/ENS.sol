// SPDX-License-Identifier: MIT
pragma solidity >=0.8.17 <0.9.0;

interface ENS {
    function owner(bytes32 node) external view returns (address);
}
