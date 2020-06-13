/// @desc Control actions on title screen.

// Decide behavior based on menu state
var sound = snd_tink;
switch menu
{
	// Main menu
	case 0:
		var choices = 4;
		
		// [Esc] -- Confirm quit
		if (keyboard_check_pressed(vk_escape))
		{
			audio_play_sound(sound, 10, false);
			menu = 4;
			current = 1;
			exit;
		}
		
		// [Up] or [W] -- Move selection up
		if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
		{
			audio_play_sound(sound, 10, false);
			current = scr_mod(current-1, choices, 0);
		}
		
		// [Down] or [S] -- Move selection down
		if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
		{
			audio_play_sound(sound, 10, false);
			current = scr_mod(current+1, choices, 0);
		}
		
		// [Enter] or [Space] -- Select current choice
		if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))
		{
			audio_play_sound(sound, 10, false);
			
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
			if (menu == 2)
				current = 8;
		}
		
		break;
	
	// Game mode menu
	case 1:
		var choices = 7; // index 0 corresponds to the title
		
		// [Esc] -- Go back
		if (keyboard_check_pressed(vk_escape))
		{
			audio_play_sound(sound, 10, false);
			menu = 0;
			current = 0;
			exit;
		}
		
		// [Up] or [W] -- Move selection up
		if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
		{
			audio_play_sound(sound, 10, false);
			current = scr_mod(current-1, choices, 1);
		}
		
		// [Down] or [S] -- Move selection down
		if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
		{
			audio_play_sound(sound, 10, false);
			current = scr_mod(current+1, choices, 1);
		}
		
		// [Enter] or [Space] -- Select current choice
		if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))
		{
			audio_play_sound(sound, 10, false);
			
			switch current
			{
				// Torus
				case 1: menu = 5; break;
				// Klein
				case 2: menu = 6; break;
				// Sphere
				case 3: menu = 7;  break;
				// RPP
				case 4: menu = 8; break;
				// Cylinder
				case 5: menu = 9; break;
				// Mobius
				case 6: menu = 10; break;
				// Go back
				case 7: menu = 0; break;
			}
			
			current = 2;
			if (menu == 0)
				current = 0;
		}

		break;
	
	// Options menu
	case 2:
		var choices = 3;
		
		// [Esc] -- Go back
		if (keyboard_check_pressed(vk_escape))
		{
			audio_play_sound(sound, 10, false);
			menu = 0;
			current = 1;
			scr_file_save();
			exit;
		}
		
		// [Up] or [W] -- Move selection up
		if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
		{
			audio_play_sound(sound, 10, false);
			current--;
			if (current < 8)
				current = 10;
		}
		
		// [Down] or [S] -- Move selection down
		if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
		{
			audio_play_sound(sound, 10, false);
			current++;
			if (current > 10)
				current = 8;
		}
		
		// Changing sound volume
		if (current == 8)
		{
			// [Left] or [A] -- Decrease volume
			if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")))
			{
				audio_play_sound(sound, 10, false);
				
				if (global.sound_volume > 0)
				{
					global.sound_volume--;
					audio_master_gain(global.sound_volume/10);
				}
			}
					
			// [Right] or [D] -- Increase volume
			if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")))
			{
				audio_play_sound(sound, 10, false);
				
				if (global.sound_volume < 10)
				{
					global.sound_volume++;
					audio_master_gain(global.sound_volume/10);
				}
			}
			
			// Continuously play sample sounds
			if (alarm[0] <= 0)
				alarm[0] = 0.75 * room_speed;
		}
		
		// [Enter] or [Space] -- Select current choice
		if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))
		{
			audio_play_sound(sound, 10, false);
			
			switch current
			{
				// Clear scores
				case 9: menu = 11; current = 1; break;
				// Go back
				case 10: menu = 0; current = 1; scr_file_save(); break;
			}
		}

		break;
	
	// Credits
	case 3:
		// [Esc], [Space], or [Enter] -- Go back
		if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))
		{
			audio_play_sound(sound, 10, false);
			menu = 0;
			current = 2;
			exit;
		}
		
		break;
	
	// Quit confirmation
	case 4:
		// [Esc] -- Quit
		if (keyboard_check_pressed(vk_escape))
		{
			audio_play_sound(sound, 10, false);
			scr_close_game();
		}
		
		// [Up] or [W] or [Down] or [S] -- Toggle selection
		if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
		{
			audio_play_sound(sound, 10, false);
			if (current >= 2)
				current = 1;
			else
				current = 2;
		}
		
		// [Enter] or [Space] -- Select current choice
		if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))
		{
			audio_play_sound(sound, 10, false);
			
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
	
	// Torus game mode
	case 5:
		var choices = 4;
		
		// [Esc] -- Go back
		if (keyboard_check_pressed(vk_escape))
		{
			audio_play_sound(sound, 10, false);
			menu = 1;
			current = 1;
			exit;
		}
		
		// [Up] or [W] -- Move selection up
		if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
		{
			audio_play_sound(sound, 10, false);
			current = scr_mod(current-1, choices, 1);
		}
		
		// [Down] or [S] -- Move selection down
		if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
		{
			audio_play_sound(sound, 10, false);
			current = scr_mod(current+1, choices, 1);
		}
		
		// [Enter] or [Space] -- Select current choice
		if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))
		{
			audio_play_sound(sound, 10, false);
			
			switch current
			{
				// Free play
				case 1: global.difficulty = 0; room_goto(rm_torus); break;
				// Normal
				case 2: global.difficulty = 1; room_goto(rm_torus); break;
				// Hard
				case 3: global.difficulty = 2; room_goto(rm_torus); break;
				// Go back
				case 4: menu = 1; current = 1; break;
			}
		}
		
		break;
	
	// Klein game mode
	case 6:
		var choices = 4;
		
		// [Esc] -- Go back
		if (keyboard_check_pressed(vk_escape))
		{
			audio_play_sound(sound, 10, false);
			menu = 1;
			current = 2;
			exit;
		}
		
		// [Up] or [W] -- Move selection up
		if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
		{
			audio_play_sound(sound, 10, false);
			current = scr_mod(current-1, choices, 1);
		}
		
		// [Down] or [S] -- Move selection down
		if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
		{
			audio_play_sound(sound, 10, false);
			current = scr_mod(current+1, choices, 1);
		}
		
		// [Enter] or [Space] -- Select current choice
		if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))
		{
			audio_play_sound(sound, 10, false);
			
			switch current
			{
				// Free play
				case 1: global.difficulty = 0; room_goto(rm_klein); break;
				// Normal
				case 2: global.difficulty = 1; room_goto(rm_klein); break;
				// Hard
				case 3: global.difficulty = 2; room_goto(rm_klein); break;
				// Go back
				case 4: menu = 1; current = 2; break;
			}
		}
		
		break;
	
	// Sphere game mode
	case 7:
		var choices = 4;
		
		// [Esc] -- Go back
		if (keyboard_check_pressed(vk_escape))
		{
			audio_play_sound(sound, 10, false);
			menu = 1;
			current = 3;
			exit;
		}
		
		// [Up] or [W] -- Move selection up
		if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
		{
			audio_play_sound(sound, 10, false);
			current = scr_mod(current-1, choices, 1);
		}
		
		// [Down] or [S] -- Move selection down
		if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
		{
			audio_play_sound(sound, 10, false);
			current = scr_mod(current+1, choices, 1);
		}
		
		// [Enter] or [Space] -- Select current choice
		if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))
		{
			audio_play_sound(sound, 10, false);
			
			switch current
			{
				// Free play
				case 1: global.difficulty = 0; room_goto(rm_sphere); break;
				// Normal
				case 2: global.difficulty = 1; room_goto(rm_sphere); break;
				// Hard
				case 3: global.difficulty = 2; room_goto(rm_sphere); break;
				// Go back
				case 4: menu = 1; current = 3; break;
			}
		}
		
		break;
	
	// RPP game mode
	case 8:
		var choices = 4;
		
		// [Esc] -- Go back
		if (keyboard_check_pressed(vk_escape))
		{
			audio_play_sound(sound, 10, false);
			menu = 1;
			current = 4;
			exit;
		}
		
		// [Up] or [W] -- Move selection up
		if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
		{
			audio_play_sound(sound, 10, false);
			current = scr_mod(current-1, choices, 1);
		}
		
		// [Down] or [S] -- Move selection down
		if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
		{
			audio_play_sound(sound, 10, false);
			current = scr_mod(current+1, choices, 1);
		}
		
		// [Enter] or [Space] -- Select current choice
		if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))
		{
			audio_play_sound(sound, 10, false);
			
			switch current
			{
				// Free play
				case 1: global.difficulty = 0; room_goto(rm_rpp); break;
				// Normal
				case 2: global.difficulty = 1; room_goto(rm_rpp); break;
				// Hard
				case 3: global.difficulty = 2; room_goto(rm_rpp); break;
				// Go back
				case 4: menu = 1; current = 4; break;
			}
		}
		
		break;
	
	// Cylinder game mode
	case 9:
		var choices = 4;
		
		// [Esc] -- Go back
		if (keyboard_check_pressed(vk_escape))
		{
			audio_play_sound(sound, 10, false);
			menu = 1;
			current = 5;
			exit;
		}
		
		// [Up] or [W] -- Move selection up
		if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
		{
			audio_play_sound(sound, 10, false);
			current = scr_mod(current-1, choices, 1);
		}
		
		// [Down] or [S] -- Move selection down
		if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
		{
			audio_play_sound(sound, 10, false);
			current = scr_mod(current+1, choices, 1);
		}
		
		// [Enter] or [Space] -- Select current choice
		if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))
		{
			audio_play_sound(sound, 10, false);
			
			switch current
			{
				// Free play
				case 1: global.difficulty = 0; room_goto(rm_cylinder); break;
				// Normal
				case 2: global.difficulty = 1; room_goto(rm_cylinder); break;
				// Hard
				case 3: global.difficulty = 2; room_goto(rm_cylinder); break;
				// Go back
				case 4: menu = 1; current = 5; break;
			}
		}
		
		break;
	
	// Mobius game mode
	case 10:
		var choices = 4;
		
		// [Esc] -- Go back
		if (keyboard_check_pressed(vk_escape))
		{
			audio_play_sound(sound, 10, false);
			menu = 1;
			current = 6;
			exit;
		}
		
		// [Up] or [W] -- Move selection up
		if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
		{
			audio_play_sound(sound, 10, false);
			current = scr_mod(current-1, choices, 1);
		}
		
		// [Down] or [S] -- Move selection down
		if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
		{
			audio_play_sound(sound, 10, false);
			current = scr_mod(current+1, choices, 1);
		}
		
		// [Enter] or [Space] -- Select current choice
		if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))
		{
			audio_play_sound(sound, 10, false);
			
			switch current
			{
				// Free play
				case 1: global.difficulty = 0; room_goto(rm_mobius); break;
				// Normal
				case 2: global.difficulty = 1; room_goto(rm_mobius); break;
				// Hard
				case 3: global.difficulty = 2; room_goto(rm_mobius); break;
				// Go back
				case 4: menu = 1; current = 6; break;
			}
		}
		
		break;
	
	// Quit confirmation
	case 11:
		// [Esc] -- Go back
		if (keyboard_check_pressed(vk_escape))
		{
			audio_play_sound(sound, 10, false);
			menu = 2;
			current = 8;
			exit;
		}
		
		// [Up] or [W] or [Down] or [S] -- Toggle selection
		if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
		{
			audio_play_sound(sound, 10, false);
			if (current >= 2)
				current = 1;
			else
				current = 2;
		}
		
		// [Enter] or [Space] -- Select current choice
		if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))
		{
			audio_play_sound(sound, 10, false);
			
			switch current
			{
				// Delete
				case 1:
					scr_clear_scores();
					clear_confirmation = 1.0;
				// Options menu
				case 2:
					menu = 2;
					current = 8;
					break;
			}
		}
		
		break;
}

// Fade out clear confirmation
if (clear_confirmation > 0)
	clear_confirmation -= 0.01*(60/room_speed);
if (clear_confirmation < 0)
	clear_confirmation = 0;
