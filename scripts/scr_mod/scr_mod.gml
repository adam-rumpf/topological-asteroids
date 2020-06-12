/// @func scr_mod(a, b, offset)
/// @desc Returns the value in the range [a,b) that is congruent to a mod b, or that value plus b if it would fall below the given offset.
/// @param {real} a The dividend, which can be any real.
/// @param {real} b The divisor, which must be strictly positive.
/// @param {real} offset A nonnegative offset to treat as a minimum result.

// Rename arguments
var a, b, offset;
a = argument[0];
b = argument[1];
offset = argument[2];

// Quit if the divisor is nonpositive
if (b <= 0)
	return 0;

// Return the nonnegative modulus
var r = a % b;
if (r >= offset)
	return r;
else
	return r + b;
