// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract LaunchPad is Ownable {
    IERC20 public rewardToken;
    IERC20 public stakeToken;
    uint startingTime;
    uint endingTime;
    uint256 constant SECONDS_PER_YEAR = 31536000;
    uint startTime;
    uint endTime;
    
    struct User {
        uint256 stakedAmount;
        uint256 startTime;
        uint256 rewardAccrued;
    }

    mapping(address => User) user;
    error tryAgain();

    constructor(address _rewardToken) {
        rewardToken = IERC20(_rewardToken);
        

    }
    
    function setStakeToken()
        external
        onlyOwner
     
    {   startingTime = block.timestamp;

       
       
    }

    function stake(uint256 amount,address _token) external    returns (address _newToken){
        User storage _user = user[msg.sender];
        uint256 _amount = _user.stakedAmount;
         stakeToken = IERC20(_token);
        _newToken = address(stakeToken);
         require(IERC20(_token) != stakeToken, "Token already set");
        require(IERC20(_token) != rewardToken, "canot stake reward");

        require(_token != address(0), "cannot set address zero");

        stakeToken.transferFrom(msg.sender, address(this), amount);
        require(startingTime == block.timestamp,"Staking not available");
        if (_amount == 0) {
            _user.stakedAmount = amount;
            _user.startTime = block.timestamp;
        } else {
            _user.stakedAmount += amount;
        }
    }

    function calcReward() public view returns (uint256 _reward) {
        User storage _user = user[msg.sender];

        uint256 _amount = _user.stakedAmount;
        uint256 _startTime = _user.startTime;
        uint256 duration = block.timestamp - _startTime;

        _reward = (duration * 20 * _amount) / (SECONDS_PER_YEAR * 100);
    }

    function withdraw(uint256 amount) public {
        endingTime = startingTime + 3600;
        require(endingTime >= block.timestamp,"reward not available" );
        User storage _user = user[msg.sender];
        uint256 staked = _user.stakedAmount;
        require(staked >= amount, "insufficient fund");
        _user.stakedAmount -= amount;
        stakeToken.transfer(msg.sender, amount);
    }

    function userInfo(address _user) external view returns (User memory) {
        return user[_user];
    }
}