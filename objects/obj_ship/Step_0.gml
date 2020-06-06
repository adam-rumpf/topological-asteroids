/// @desc Ship behavior during gameplay.

// [Left] or [A] -- turn left
if (keyboard_check(vk_left) || keyboard_check(ord("A")))
	image_angle += turn_speed;

// [Right] or [D] -- turn right
if (keyboard_check(vk_right) || keyboard_check(ord("D")))
	image_angle -= turn_speed;

// [Up] or [W] -- thrust forward
if (keyboard_check(vk_up) || keyboard_check(ord("W")))
	motion_add(image_angle, acceleration);

// [Space] press -- fire a bullet (accounting for fire delay)
// Bullet firing is actually handled by the ship parent object.

// Wrap at edges of overall room torus
move_wrap(true, true, 0);

// For cylinder and Mobius rooms, cut off movement at edge
if (room == rm_cylinder || room = rm_mobius)
{
	if (y < global.cell_size)
	{
		vspeed = 0;
		y = global.cell_size;
	}
	else if (y > 2*global.cell_size)
	{
		vspeed = 0;
		y = 2*global.cell_size;
	}
}
