// SPDX-License-Identifier: MIT
pragma solidity >=0.8.17 <0.9.0;

interface IReverseRegistrar {
    function claim(address owner) external returns (bytes32);
}
