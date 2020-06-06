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
// This is actually accomplished by spawning a parent object to control all bullets
if (keyboard_check_pressed(vk_space) && can_shoot)
{
	/*
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
	*/
	
	// Create a parent for the bullets
	var parent = instance_create_layer(0, 0, "Instances", obj_bullet_parent);
	
	// Calculate bullet position (slightly in front of ship to avoid self-collision)
	var xx, yy;
	xx = x + 0.8*sprite_width*cos(degtorad(image_angle));
	yy = y - 0.8*sprite_width*sin(degtorad(image_angle));
	
	// Calculate bullet velocity (relative to ship velocity)
	var spd, dir, vx, vy;
	vx = 10*cos(degtorad(image_angle)) + hspeed;
	vy = 10*sin(degtorad(image_angle)) - vspeed;
	spd = sqrt(sqr(vx)+sqr(vy));
	dir = point_direction(0, 0, vx, -vy);
	
	// Call bullet spawn script and assign children to parent
	var bl = scr_spawn(obj_bullet, parent, global.symmetry, xx, yy, dir, spd);
	parent.bullets = bl;
	
	
	
	
	
	/*var xx, yy, bullets, parent;
	parent = 
	xx = x + 0.8*sprite_width*cos(degtorad(image_angle));
	yy = y - 0.8*sprite_width*sin(degtorad(image_angle));
	bullets = scr_spawn(obj_bullet, id, global.symmetry, xx, yy, 0, 10);
	instance_create_layer(xx, yy, "Instances", obj_bullet_parent);*/
	
	//###
	//var bullet = instance_create_layer(xx, yy, "Instances", obj_bullet);
	//bullet.direction = dir;
	//bullet.speed = spd;
	
	// Start firing cooldown
	can_shoot = false;
	alarm[0] = cooldown;
}

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
