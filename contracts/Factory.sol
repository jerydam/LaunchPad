// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;
import {LaunchPad} from "./Launchpad.sol";

contract cloneMultiSig {
    LaunchPad[] private _launchpad;

    event child(address _child);

    function createLau(address[] memory _admins)
        public
        returns (MultiSig newMultisig)
    {
        newMultisig = new MultiSig(_admins, msg.sender);
        _multisigs.push(newMultisig);

        emit child(address(newMultisig));
    }
}
