
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../lib/forge-std/src/Script.sol";

import "../src/PlonkVerifier.sol";
import "../src/VerifyOrigin.sol";

contract VerifyOriginScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        PlonkVerifier pv = new PlonkVerifier();
        VerifyOrigin vo = new VerifyOrigin(address(pv));

        vm.stopBroadcast();
    }
}