/// @desc Control actions on title screen.

// Decide behavior based on menu state
//###
switch state
{
	// Main menu
	case 0:
		// [Esc] -- Confirm quit
		if (keyboard_check_pressed(vk_escape))
		{
			state = 4;
			exit;
		}
	
		//### Temporary code to enter test room from menu.
		if (keyboard_check_pressed(ord("1")))
		{
			global.camera = 0;
			room_goto(rm_torus);
		}
		if (keyboard_check_pressed(ord("2")))
		{
			global.camera = 0;
			room_goto(rm_klein);
		}
		if (keyboard_check_pressed(ord("3")))
		{
			global.camera = 0;
			room_goto(rm_sphere);
		}
		if (keyboard_check_pressed(ord("4")))
		{
			global.camera = 0;
			room_goto(rm_rpp);
		}
		if (keyboard_check_pressed(ord("5")))
		{
			global.camera = 0;
			room_goto(rm_cylinder);
		}
		if (keyboard_check_pressed(ord("6")))
		{
			global.camera = 0;
			room_goto(rm_mobius);
		}
		break;
	
	// Quit confirmation
	case 4:
		// If confirming quit, listen for [Enter] to quit and [Esc] to go back
		if (keyboard_check_pressed(vk_enter))
			scr_close_game();
		if (keyboard_check_pressed(vk_escape))
			state = 0;
		break;
}
