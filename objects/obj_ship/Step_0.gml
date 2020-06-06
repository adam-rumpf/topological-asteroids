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
if (keyboard_check_pressed(vk_space) && can_shoot)
{
	var bullet, xx, yy;
	
	// Spawn bullet slightly in front of the ship to avoid self-collisions
	xx = x + 0.8*sprite_width*cos(degtorad(image_angle));
	yy = y - 0.8*sprite_width*sin(degtorad(image_angle));
	bullet = instance_create_layer(xx, yy, "Instances", obj_bullet);
	
	// Bullet velocity is relative to ship velocity
	bullet.direction = image_angle;
	bullet.speed = 10;
	bullet.hspeed += hspeed;
	bullet.vspeed += vspeed;
	
	// Start firing cooldown
	can_shoot = false;
	alarm[0] = cooldown;
}

// Wrap at edges of overall room torus
move_wrap(true, true, 0);
