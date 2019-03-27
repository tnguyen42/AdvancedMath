const { BN, shouldFail } = require("openzeppelin-test-helpers");
const { factorial } = require("mathjs");

require("chai")
	.use(require("chai-as-promised"))
	.should();

const AdvancedMathMock = artifacts.require("AdvancedMathMock");

// Bignumber should be equal to expected more or less 5% (equivalent to /20)
function approximateBN(bignumber, expected) {
	const floor = expected - expected / 20;
	const ceil = expected + expected / 20;
	console.log("NEW TEST");
	console.log("Actual value: ", bignumber.toNumber());
	console.log("Expected: ", expected);
	console.log("Maximum tolerated: ", ceil);
	console.log("Minimum tolerated: ", floor);
	target = bignumber.toNumber();
	target.should.be.at.least(floor);
	target.should.be.at.most(ceil);
}

contract("AdvancedMath", function() {
	beforeEach(async function() {
		this.advancedMath = await AdvancedMathMock.new();
	});

	describe("Power tests", function() {
		it("should return a correct value when there is no overflow", async function() {
			this.power = await this.advancedMath.power(3, 4);
			this.expected = new BN(Math.pow(3, 4));
			this.power.should.be.bignumber.equal(this.expected);
		});
		it("should return a correct value for a^0", async function() {
			this.power = await this.advancedMath.power(3, 0);
			this.expected = new BN(Math.pow(3, 0));
			this.power.should.be.bignumber.equal(this.expected);
		});
		it("should revert on overflow", async function() {
			await shouldFail.reverting(this.advancedMath.power(2, 257));
		});
	});
	describe("Factorial tests", function() {
		it("should return a correct value for factorial(0)", async function() {
			this.factorial = await this.advancedMath.factorial(0);
			this.expected = new BN(factorial(0));
			this.factorial.should.be.bignumber.equal(this.expected);
		});
		it("should return a correct value when there is no overflow", async function() {
			this.factorial = await this.advancedMath.factorial(5);
			this.expected = new BN(factorial(5));
			this.factorial.should.be.bignumber.equal(this.expected);
		});
		it("should revert on overflow", async function() {
			await this.advancedMath.factorial(57).should.be.fulfilled;
			await shouldFail.reverting(this.advancedMath.factorial(58));
		});
	});

	describe("Exponential tests", function() {
		it("should return a correct value for exp(0)", async function() {
			this.power = await this.advancedMath.exp(0);
			this.expected = Math.exp(0);
			approximateBN(this.power, this.expected);
		});
		it("should return a correct value when there is no overflow", async function() {
			this.power = await this.advancedMath.exp(3);
			this.expected = Math.exp(3);
			approximateBN(this.power, this.expected);
		});
		it("should return a correct value when there is no overflow", async function() {
			this.power = await this.advancedMath.exp(10);
			this.expected = Math.exp(10);
			approximateBN(this.power, this.expected);
		});
		it("should return a correct value when there is no overflow", async function() {
			this.power = await this.advancedMath.exp(20);
			this.expected = Math.exp(20);
			approximateBN(this.power, this.expected);
		});
		it("should return a correct value when there is no overflow", async function() {
			this.power = await this.advancedMath.exp(200);
			this.expected = Math.exp(200);
			approximateBN(this.power, this.expected);
		});
		it("should revert on overflow", async function() {
			await shouldFail.reverting(this.advancedMath.exp(2000));
		});
	});
});
