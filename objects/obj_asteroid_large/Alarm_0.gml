/// @desc Become active after warning is done.

// Become visible and start moving
sprite_index = spr_asteroid_large;
speed = abs(turn_speed);

// Large entrance
for (var i = 0; i < 4; i++)
	scr_debris(x, y, image_angle + 22.5*i);
