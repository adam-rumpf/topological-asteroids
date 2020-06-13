/// @desc Listen for asteroid interactions.

// Destroy all children if one has signified its own death
if (dead == true)
{
	// Play a small explosion sound, pitch-adjusted according to size
	var sound = audio_play_sound(snd_pow, 8, false);
	
	// Large asteroids break into two medium asteroids
	if (size == 2)
	{
		// Lower sound pitch
		audio_sound_pitch(sound, 0.75);
		
		repeat (2)
		{
			// Create a new non-spawning parent to store the new child
			var parent = instance_create_layer(x, y, "Instances", obj_asteroid_parent_empty);
			
			// Spawn a set of medium asteroids centered at the current main asteroid
			// Choose random speed and direction
			var xx, yy, spd, dir;
			xx = asteroids[1,1].x - global.cell_size;
			yy = asteroids[1,1].y - global.cell_size;
			spd = (choose(-1, 1) * random_range(0.75, 2.5)) * (60/room_speed);
			dir = irandom(359);
			var ls = scr_spawn(obj_asteroid_medium_immediate, parent, global.symmetry, xx, yy, dir, spd);
			
			// Assign the child list to the new parent
			parent.asteroids = ls;
			parent.size = 1;
		}
	}
	
	// Medium asteroids break into two small asteroids
	if (size == 1)
	{
		repeat (2)
		{
			// Create a new non-spawning parent to store the new child
			var parent = instance_create_layer(x, y, "Instances", obj_asteroid_parent_empty);
			
			// Spawn a set of medium asteroids centered at the current main asteroid
			// Choose random speed and direction
			var xx, yy, spd, dir;
			xx = asteroids[1,1].x - global.cell_size;
			yy = asteroids[1,1].y - global.cell_size;
			spd = (choose(-1, 1) * random_range(1, 3)) * (60/room_speed);
			dir = irandom(359);
			var ls = scr_spawn(obj_asteroid_small_immediate, parent, global.symmetry, xx, yy, dir, spd);
			
			// Assign the child list to the new parent
			parent.asteroids = ls;
			parent.size = 0;
		}
	}
	
	// Small asteroids use a higher pitch
	if (size == 0)
		audio_sound_pitch(sound, 1.25);
	
	// Loop through all children to destroy them
	if (room = rm_cylinder || room = rm_mobius)
	{
		for (var j = 0; j < global.cell_num; j++)
			instance_destroy(asteroids[1,j]);
	}
	else
	{
		for (var i = 0; i < global.cell_num; i++)
		{
			for (var j = 0; j < global.cell_num; j++)
				instance_destroy(asteroids[i,j]);
		}
	}
	
	// Then destroy self
	instance_destroy();
}
