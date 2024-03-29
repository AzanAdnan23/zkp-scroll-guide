// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IPlonkVerifier {
    function verifyProof(
        bytes memory proof,
        uint[] memory pubSignals
    ) external view returns (bool);
}

contract VerifyOrigin {
    address public s_plonkVerifierAddress;

    event OriginVerified(bool result);

    constructor(address plonkVerifierAddress) {
        s_plonkVerifierAddress = plonkVerifierAddress;
    }

    function submitProof(
        bytes memory proof,
        uint256[] memory pubSignals
    ) public returns (bool) {
        bool result = IPlonkVerifier(s_plonkVerifierAddress).verifyProof(
            proof,
            pubSignals
        );

        emit OriginVerified(result);
        return result;
    }
}
