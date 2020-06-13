/// @func scr_return_game()
/// @desc Returns to the proper game selection menu based on the current room.

// Set current menu position
global.menu_current = global.difficulty + 1;

// Choose correct room selection screen
switch room
{
	case rm_torus:
		global.menu = 5;
		break;
	
	case rm_klein:
		global.menu = 6;
		break;
	
	case rm_sphere:
		global.menu = 7;
		break;
	
	case rm_rpp:
		global.menu = 8;
		break;
	
	case rm_cylinder:
		global.menu = 9;
		break;
	
	case rm_mobius:
		global.menu = 10;
		break;
}

// Go to title room
room_goto(rm_title);
