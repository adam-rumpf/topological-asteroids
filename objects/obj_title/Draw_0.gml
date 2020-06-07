/// @desc Draw text on title screen.

// Decide what to draw based on current menu screen
//###
switch state
{
	// Main menu
	case 0:
		draw_set_halign(fa_center);
		var cw = c_white;
		//### Temporary controls to go directly to rooms
		draw_text_color(room_width/2, (room_height/2)-60, "Press [1] to go to the torus test room.", cw, cw, cw, cw, 1);
		draw_text_color(room_width/2, (room_height/2)-30, "Press [2] to go to the Klein test room.", cw, cw, cw, cw, 1);
		draw_text_color(room_width/2, (room_height/2)+0, "Press [3] to go to the sphere test room.", cw, cw, cw, cw, 1);
		draw_text_color(room_width/2, (room_height/2)+30, "Press [4] to go to the RPP test room.", cw, cw, cw, cw, 1);
		draw_text_color(room_width/2, (room_height/2)+60, "Press [5] to go to the cylinder test room.", cw, cw, cw, cw, 1);
		draw_text_color(room_width/2, (room_height/2)+90, "Press [6] to go to the Mobius test room.", cw, cw, cw, cw, 1);
		break;
	
	// Quit confirmation
	case 3:
		draw_set_halign(fa_center);
		var cw = c_white;
		//### Temporary
		draw_text_color(room_width/2, (room_height/2)-30, "Are you sure you want to quit?", cw, cw, cw, cw, 1);
		draw_text_color(room_width/2, (room_height/2)+0, "Press [Enter] to quit", cw, cw, cw, cw, 1);
		draw_text_color(room_width/2, (room_height/2)+30, "Press [Esc] to go back", cw, cw, cw, cw, 1);
		break;
}
