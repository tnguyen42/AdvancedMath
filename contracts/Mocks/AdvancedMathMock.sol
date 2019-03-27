pragma solidity ^0.5.2;

import '../AdvancedMath.sol';

/**
 * @title AdvancedMathMock
 * @author Thanh-Quy Nguyen
 * @dev Mock of the AdvancedMath library for testing.
 */

contract AdvancedMathMock {
	
	using AdvancedMath for uint256;

	function power(uint256 a, uint256 b) public pure returns (uint256) {
		return AdvancedMath.power(a, b);
	}

	function factorial(uint256 a) public pure returns (uint256) {
		return AdvancedMath.factorial(a);
	}

	function exp(uint256 a, uint256 precision) public pure returns (uint256) {
		return AdvancedMath.exp(a, precision);
	}

	function exp(uint256 a) public pure returns (uint256) {
		return AdvancedMath.exp(a);
	}

	function decimalExp(uint256 a, uint256 decimals, uint256 precision) public pure returns (uint256) {
		return AdvancedMath.decimalExp(a, decimals, precision);
	}

	function decimalExp(uint256 a, uint256 decimals) public pure returns (uint256) {
		return AdvancedMath.decimalExp(a, decimals);
	}

}