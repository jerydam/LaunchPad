// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;
import {LaunchPad} from "./Launchpad.sol";

contract cloneMultiSig {
    LaunchPad[] private _launchpad;

    event child(address _child);

    function createLau(address[] memory _admins)
        public
        returns (LaunchPad newLaunchPad)
    {
        newLaunchPad = new LaunchPad(_admins, msg.sender);
        _launchpad.push(newLaunchPad);

        emit child(address(newLaunchPad));
    }
}
