/// @desc Wrap at edges of room torus.

if (room == rm_cylinder || room == rm_mobius)
	// Wrap horizontally lonly for cylinder or mobius
	move_wrap(true, false, 0);
else
	// Otherwise wrap in both directions
	move_wrap(true, true, 0);
