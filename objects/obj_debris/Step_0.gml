/// @desc Fade out and destroy self when invisible.

image_alpha -= 0.01*(60/room_speed);

if (image_alpha <= 0)
	instance_destroy();
