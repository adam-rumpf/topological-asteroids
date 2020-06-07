/// @desc Initializing room and  attributes.

// Set initial asteroid timer
switch global.difficulty
{
	// Free or Normal
	case 0:
	case 1:
		delay = 6;
		break;
	
	// Hard
	case 2:
		delay = 4;
		break;
}

// Set shorter alarm for the first spawn
alarm[0] = 2*room_speed;
large = true; // whether to force a large asteroid
