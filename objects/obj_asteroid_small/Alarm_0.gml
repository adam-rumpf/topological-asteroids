/// @desc Become active after warning is done.

// Become visible and start moving
sprite_index = spr_asteroid_small;
speed = abs(turn_speed);

// Small entrance
scr_debris(x, y, image_angle);
