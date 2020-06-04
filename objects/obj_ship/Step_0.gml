/// @desc Ship behavior during gameplay.

// [Left]
if (keyboard_check(vk_left))
	image_angle += turn_speed;

// [Right]
if (keyboard_check(vk_right))
	image_angle -= turn_speed;

// [Up]
if (keyboard_check(vk_up))
	motion_add(image_angle, acceleration);
