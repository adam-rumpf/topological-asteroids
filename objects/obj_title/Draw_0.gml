/// @desc Draw text on title screen.

// Decide what to draw based on current menu screen
//###
var cw = c_white;
draw_text_color(room_width - 120, 60, string(current), cw, cw, cw, cw, 1);//###
var options = ["UNKNOWN"];
switch menu
{
	// Main menu
	case 0:
		options = ["Start Game", "Options", "Credits", "Quit"];
		break;
		
		//draw_set_halign(fa_center);
		//### Temporary controls to go directly to rooms
		/*draw_text_color(room_width/2, (room_height/2)-90, string_replace_all(program_directory, "\\", "\\\\"), cw, cw, cw, cw, 1);
		draw_text_color(room_width/2, (room_height/2)-60, "Press [1] to go to the torus test room.", cw, cw, cw, cw, 1);
		draw_text_color(room_width/2, (room_height/2)-30, "Press [2] to go to the Klein test room.", cw, cw, cw, cw, 1);
		draw_text_color(room_width/2, (room_height/2)+0, "Press [3] to go to the sphere test room.", cw, cw, cw, cw, 1);
		draw_text_color(room_width/2, (room_height/2)+30, "Press [4] to go to the RPP test room.", cw, cw, cw, cw, 1);
		draw_text_color(room_width/2, (room_height/2)+60, "Press [5] to go to the cylinder test room.", cw, cw, cw, cw, 1);
		draw_text_color(room_width/2, (room_height/2)+90, "Press [6] to go to the Mobius test room.", cw, cw, cw, cw, 1);
		break;*/
	
	// Quit confirmation
	case 4:
		//### Temporary
		// Set text font and define colors
		draw_set_font(fnt_consolas);
		var cw = c_white;
		draw_set_halign(fa_center);
		draw_text_color(room_width/2, room_height/2, "Press [Esc] again to quit.", cw, cw, cw, cw, 1);
		draw_text_color(room_width/2, (room_height/2)+30, "Press [Enter] to return to main menu.", cw, cw, cw, cw, 1);
		break;
}

// Display the menu options
scr_menu(options, current);
