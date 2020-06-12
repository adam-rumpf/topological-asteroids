/// @desc Draw text on title screen.

// Move selector towards target
if (current_pos_target >= 0)
{
	var diff = current_pos_target - current_pos; // difference in coordinates
	var step = 0.1 * room_speed; // how far to move
	
	// If close enough (or if first), snap to correct position
	if (abs(diff) <= step || current_pos < 0)
		current_pos = current_pos_target;
	// Otherwise step towards it
	else
	{
		if (diff > 0)
			current_pos += step;
		if (diff < 0)
			current_pos -= step;
	}
	
	// Draw selector
	draw_set_alpha(0.5);
	draw_rectangle_color(0, current_pos-15, room_width, current_pos+15, c_gray, c_gray, c_gray, c_gray, false);
	draw_set_alpha(1);
}
else
	// Hide selector when nothing is selected
	current_pos = -room_height;

// Decide what to draw based on current menu screen
//###
var cw = c_white;
draw_text_color(room_width - 120, 60, string(current), cw, cw, cw, cw, 1);//###
switch menu
{
	// Main menu
	case 0:
		options = ["Start Game", "Options", "Credits", "Quit"];
		current_pos_target = scr_menu(options, current);
		break;
	
	// Game mode menu
	case 1:
		options = ["Choose a surface:", "Torus", "Klein Bottle", "Sphere", "Real Projective Plane", "Cylinder", "Mobius Strip", "[back]"];
		current_pos_target = scr_menu(options, current);
		break;
	
	// Credits
	case 3:
		options = ["back"];
		current_pos_target = scr_credits();
		break;
	
	// Quit confirmation
	case 4:
		options = ["Are you sure you want to quit?", "[quit]", "[back]"];
		current_pos_target = scr_menu(options, current);
		break;
}
