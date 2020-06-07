/// @desc Ship destroyed on bullet collision.

// No death on free play mode
if (global.difficulty == 0)
	exit;

// Inform parent of death
parent.dead = true;
