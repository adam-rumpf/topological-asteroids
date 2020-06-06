/// @desc Fade in.

image_alpha += 1/(global.warning_time*room_speed);

// Disappear when fully visible
if (image_alpha >= 1)
	instance_destroy();
