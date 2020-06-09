/// @desc Draw text on title screen.

// Set text font and define colors
draw_set_font(fnt_consolas);
var cw = c_white;

// Decide what to draw based on current menu screen
//###
switch state
{
	// Main menu
	case 0:
		draw_set_halign(fa_center);
		//### Temporary controls to go directly to rooms
		draw_text_color(room_width/2, (room_height/2)-60, "Press [1] to go to the torus test room.", cw, cw, cw, cw, 1);
		draw_text_color(room_width/2, (room_height/2)-30, "Press [2] to go to the Klein test room.", cw, cw, cw, cw, 1);
		draw_text_color(room_width/2, (room_height/2)+0, "Press [3] to go to the sphere test room.", cw, cw, cw, cw, 1);
		draw_text_color(room_width/2, (room_height/2)+30, "Press [4] to go to the RPP test room.", cw, cw, cw, cw, 1);
		draw_text_color(room_width/2, (room_height/2)+60, "Press [5] to go to the cylinder test room.", cw, cw, cw, cw, 1);
		draw_text_color(room_width/2, (room_height/2)+90, "Press [6] to go to the Mobius test room.", cw, cw, cw, cw, 1);
		break;
	
	// Quit confirmation
	case 4:
		draw_set_halign(fa_center);
		//### Temporary
		draw_text_color(room_width/2, room_height/2, "Press [Esc] again to quit.", cw, cw, cw, cw, 1);
		draw_text_color(room_width/2, (room_height/2)+30, "Press [Enter] to return to main menu.", cw, cw, cw, cw, 1);
		break;
}
