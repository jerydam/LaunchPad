// // SPDX-License-Identifier: UNLICENSED
// pragma solidity ^0.8.17;
// import {LaunchPad} from "./Launchpad.sol";

// contract cloneLaunchpad {
//     LaunchPad[] private _launchPad;

//     event child(address _child);

//     function createMultiSig(address[] memory _admins)
//         public
//         returns (LaunchPad newLaunchPad)
//     {
//         newLaunchPad = new LaunchPad(_admins, msg.sender);
//         _launchPad.push(newLaunchPad);

//         emit child(address(newLaunchPad));
//     }
// }
