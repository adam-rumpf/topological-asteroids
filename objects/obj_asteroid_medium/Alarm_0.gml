/// @desc Become active after warning is done.

// Become visible and start moving
sprite_index = spr_asteroid_medium;
speed = abs(turn_speed);

// Medium entrance
scr_debris(x, y, image_angle);
scr_debris(x, y, image_angle + 45);
