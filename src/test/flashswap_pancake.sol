// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "./interface.sol";


contract ContractTest is DSTest {
    IPancakePair PancakePair = IPancakePair(0x0eD7e52944161450477ee417DE9Cd3a859b14fD0);
    WBNB wbnb = WBNB(0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c);

    function testExploit() public {
     
        bytes memory data = abi.encode(0x0eD7e52944161450477ee417DE9Cd3a859b14fD0, 1000*1e18);
        wbnb.deposit{value: 20*1e18}();
        emit log_named_uint("Before flashswap, WBNB balance of attacker:", wbnb.balanceOf(address(this)));
       //Borrow 1,000 BNB
        PancakePair.swap(0,1000*1e18,address(this),data);
 
}
  function pancakeCall(address sender, uint amount0, uint amount1, bytes calldata data) public{

        emit log_named_uint("After flashswap, WBNB balance of attacker:", wbnb.balanceOf(address(this)));
        wbnb.transfer(0x0eD7e52944161450477ee417DE9Cd3a859b14fD0, 1020*1e18);
        emit log_named_uint("After repay, WBNB balance of attacker:", wbnb.balanceOf(address(this)));
  }
   receive() external payable {}
}
