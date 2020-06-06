/// @desc Listen for ship interactions.

// Destroy all children if one has signified its own death
if (dead == true)
{
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
	
	// Set a delay and then restart the room
	alarm[0] = 3*room_speed;
	
	// Reset flag to prevent timer from resetting
	dead = false;
}
