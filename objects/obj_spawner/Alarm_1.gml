/// @desc Increment score over time.

// Stop scoring if dead
if (global.alive == false)
	exit;

score += 1;
alarm[1] = 0.1*room_speed;
