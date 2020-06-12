/// @func scr_mod(a, b)
/// @desc Returns the value in the range [a,b) that is congruent to a mod b.
/// @param {real} a The dividend, which can be any real.
/// @param {real} b The divisor, which must be strictly positive.

// Rename arguments
var a, b;
a = argument[0];
b = argument[1];

// Quit if the divisor is nonpositive
if (b <= 0)
	return 0;

// Return the nonnegative modulus
var r = a % b;
if (r >= 0)
	return r;
else
	return r + b;
