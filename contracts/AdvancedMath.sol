pragma solidity ^0.5.2;

import './SafeMath.sol';

/**
 * @title AdvancedMath
 * @author Thanh-Quy Nguyen
 * @dev Library introducing exponential, logarithmic and trigonometric functions
 * in Solidity for uint256. Also includes power and factorial with handle of potential overflows.
 */
library AdvancedMath {

	using SafeMath for uint256;

	/**
	 * @dev Returns a to the power of b, reverts on overflow
	 * @param a The uint256 to be put to the power of b
	 * @param b The power
	 * @return a^b
	 */
	function power(uint256 a, uint256 b) internal pure returns (uint256) {
		uint s = 1;
		for (uint256 i = 0 ; i < b ; i++) {
			s = s.mul(a);
		}
		return s;
	}

	/**
	 * @dev Returns factorial of a (a!), reverts on overflow
	 * @param a The argument of the factorial
	 * @return Factorial of a (a!)
	 */
	function factorial(uint256 a) internal pure returns (uint256) {
		require(a <= 57, 'Factorial overflow. Argument of the factorial function should be <= 57');
		uint256 s = 1;
		for (uint i = 1 ; i <= a ; i++) {
			s = s*i;
		}
		return s;
	}

	/**
	 * @dev Returns the exponential (e) of the argument
	 * @param a The uint256 we want the exponential of
	 * @return exp(a)
	 */
	function exp(uint256 a) internal pure returns (uint256) {
		return exp(a, 40);
	}

	/**
	 * @dev Overload of the exponential (e) function, allowing to add
	 * an optional argument for the range of the Fourier's development.
	 * A higher range means higher precision but higher gas cost, a lower
	 * range means lower precision but lower gas cost.
	 * By default, the range is 40.
	 * @param a The uint256 we want the exponential of
	 * @param precision The number of Fourier's terms (= precision). Maximum precision is currently 57 to avoid overflows on the Factorial.
	 * @return exp(a)
	 */
	function exp(uint256 a, uint256 precision) internal pure returns (uint256) {
		uint256 s = 0;
		if (a <= 10) {
			for (uint256 i = 0 ; i <= precision ; i++) {
				s = s.add(power(a, i).mul(100)/factorial(i));
			}
			return s/100;
		}
		for (uint256 i = 0 ; i <= precision ; i++) {
			s = s.add(power(a, i)/factorial(i));
		}
		return s;
	}

	/**
	 * @dev Returns the natural logarithm (ln) of the argument
	 * @param a The uint256 we want the natural logarithm of
	 * @return ln(a)
	 */
	function ln(uint256 a) internal pure returns (uint256) {

	}

	/**
	 * @dev Overload of the natural logarithm (ln) function, allowing to add
	 * an optional argument for the range of the Fourier's development.
	 * A higher range means higher precision but higher gas cost, a lower
	 * range means lower precision but lower gas cost.
	//  * By default, the range is 40.
	 * @param a The uint256 we want the exponential from
	 * @param precision The number of Fourier's terms (= precision)
	 * @return ln(a)
	 */
	function ln(uint256 a, uint256 precision) internal pure returns (uint256) {

	}

}