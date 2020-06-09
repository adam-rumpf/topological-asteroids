/// @desc Gameplay ship spawning and destruction events.

// [Space] press -- fire a bullet (accounting for fire delay)
if (keyboard_check_pressed(vk_space) && can_shoot)
{
	// Relative to base ship
	with (base)
	{
		// Create a parent for the bullets
		var parent = instance_create_layer(0, 0, "Instances", obj_bullet_parent);
	
		// Calculate bullet position (slightly in front of ship to avoid self-collision)
		var xx, yy;
		xx = (x + 0.6*sprite_width*cos(degtorad(image_angle))) - global.cell_size;
		yy = (y - 0.6*sprite_width*sin(degtorad(image_angle))) - global.cell_size;
	
		// Calculate bullet velocity (relative to ship velocity)
		var spd, dir, vx, vy;
		vx = 10*cos(degtorad(image_angle)) + hspeed;
		vy = 10*sin(degtorad(image_angle)) - vspeed;
		spd = sqrt(sqr(vx)+sqr(vy));
		dir = point_direction(0, 0, vx, -vy);
		
		// Call bullet spawn script and assign children to parent
		var bl = scr_spawn(obj_bullet, parent, global.symmetry, xx, yy, dir, spd);
		parent.bullets = bl;
	}
	
	// Start firing cooldown
	can_shoot = false;
	alarm[0] = cooldown;
}

// Destroy all children if one has signified its own death
if (dead == true)
{
	// Decrease life count
	lives -= 1;
	
	// Set global and local death variables
	global.alive = false;
	dead = false;
	
	//### We would also play a single destruction sound at this time.
	
	// Loop through all children to destroy them
	if (room = rm_cylinder || room = rm_mobius)
	{
		for (var j = 0; j < global.cell_num; j++)
			instance_destroy(ships[1,j]);
	}
	else
	{
		for (var i = 0; i < global.cell_num; i++)
		{
			for (var j = 0; j < global.cell_num; j++)
				instance_destroy(ships[i,j]);
		}
	}
	
	// Set a delay to reset the room
	alarm[1] = 3*room_speed;
}
