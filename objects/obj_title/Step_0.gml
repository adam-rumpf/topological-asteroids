/// @desc Control actions on title screen.

// Decide behavior based on menu state
//###
switch menu
{
	// Main menu
	case 0:
		var choices = 4;
		
		// [Esc] -- Confirm quit
		if (keyboard_check_pressed(vk_escape))
		{
			menu = 4;
			exit;
		}
		
		// [Up] or [W] -- Move selection up
		if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
			current = scr_mod(current-1, choices)
		
		// [Down] or [S] -- Move selection down
		if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
			current = scr_mod(current+1, choices)
		
		// [Enter] or [Space] -- Select current choice
		if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))
		{
			switch current
			{
				// Start
				case 0: menu = 1; break;
				// Options
				case 1: menu = 2; break;
				// Credits
				case 2: menu = 3; break;
				// Quit
				case 3: menu = 4; break;
			}
			
			current = 0;
		}
		
		break;
	
		//### Temporary code to enter test room from menu.
		/*if (keyboard_check_pressed(ord("1")))
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
		break;*/
	
	// Quit confirmation
	case 4:
		// If confirming quit, listen for [Esc] to quit and [Enter] to go back
		if (keyboard_check_pressed(vk_escape))
			scr_close_game();
		if (keyboard_check_pressed(vk_enter))
			menu = 0;
		break;
}
