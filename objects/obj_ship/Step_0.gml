/// @desc Ship behavior during gameplay.

// [Left] or [A]
if (keyboard_check(vk_left) || keyboard_check(ord("A")))
	image_angle += turn_speed;

// [Right] or [D]
if (keyboard_check(vk_right) || keyboard_check(ord("D")))
	image_angle -= turn_speed;

// [Up] or [W]
if (keyboard_check(vk_up) || keyboard_check(ord("W")))
	motion_add(image_angle, acceleration);

// Wrap at edges of overall room torus
move_wrap(true, true, 0);
