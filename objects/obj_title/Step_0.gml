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
			current = 1;
			exit;
		}
		
		// [Up] or [W] -- Move selection up
		if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
			current = scr_mod(current-1, choices, 0);
		
		// [Down] or [S] -- Move selection down
		if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
			current = scr_mod(current+1, choices, 0);
		
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
			
			current = 1;
		}
		
		break;
	
	// Game mode menu
	case 1:
		var choices = 7; // index 0 corresponds to the title
		
		// [Esc] -- Go back
		if (keyboard_check_pressed(vk_escape))
		{
			menu = 0;
			current = 0;
			exit;
		}
		
		// [Up] or [W] -- Move selection up
		if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
			current = scr_mod(current-1, choices, 1);
		
		// [Down] or [S] -- Move selection down
		if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
			current = scr_mod(current+1, choices, 1);
		
		// [Enter] or [Space] -- Select current choice
		if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))
		{
			switch current
			{
				// Torus
				case 1: menu = 5; break;
				// Klein
				case 2: menu = 6; break;
				// Sphere
				case 3: menu = 7; break;
				// RPP
				case 4: menu = 8; break;
				// Cylinder
				case 5: menu = 9; break;
				// Mobius
				case 6: menu = 10; break;
				// Go back
				case 7: menu = 0; break;
			}
			
			current = 1;
			if (menu == 0)
				current = 0;
		}

		break;
	
	// Credits
	case 3:
		// [Esc], [Space], or [Enter] -- Go back
		if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))
		{
			menu = 0;
			current = 0;
			exit;
		}
		
		break;
	
	// Quit confirmation
	case 4:
		// [Esc] -- Quit
		if (keyboard_check_pressed(vk_escape))
			scr_close_game();
		
		// [Up] or [W] or [Down] or [S] -- Toggle selection
		if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
		{
			if (current >= 2)
				current = 1;
			else
				current = 2;
		}
		
		// [Enter] or [Space] -- Select current choice
		if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))
		{
			switch current
			{
				// Quit
				case 1:
					scr_close_game();
					break;
				// Main menu
				case 2:
					menu = 0;
					current = 3;
					break;
			}
		}
		
		break;
}
