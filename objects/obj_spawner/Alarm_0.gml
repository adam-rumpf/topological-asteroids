/// @desc Spawn an asteroid and reset timer.

if (large == true)
	instance_create_layer(x, y, "Instances", obj_asteroid_parent_large);
else
	instance_create_layer(x, y, "Instances", obj_asteroid_parent);

// Reset timer to spawn next asteroid
alarm[0] = delay*room_speed;

// Speed up spawn rate as game goes on
switch global.difficulty
{
	// Free or Normal
	case 0:
	case 1:
		delay = max(2, delay - 0.025);
		large = false; // asteroids after first are random
		break;
	
	// Hard
	case 2:
		delay = max(1.5, delay - 0.05);
		break;
}
