/// @desc Asteroid behavior during gameplay.

// Slowly rotate
image_angle += turn_speed;

// Wrap at edges of overall room torus
if (room == rm_cylinder || room == rm_mobius)
	// Wrap horizontally only for cylinder or mobius
	move_wrap(true, false, 0);
else
	// Otherwise wrap in both directions
	move_wrap(true, true, 0);
