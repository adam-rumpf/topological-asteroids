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
var cy = c_yellow;
var cr = c_red;
draw_text_color(room_width - 120, 60, string(current), cw, cw, cw, cw, 1);//###
switch menu
{
	// Main menu
	case 0:
		options = ["Start Game", "Options", "Credits", "Quit"];
		current_pos_target = scr_menu(options, current, 0);
		break;
	
	// Game mode menu
	case 1:
		options = ["Choose a surface:", "Torus", "Klein Bottle", "Sphere", "Real Projective Plane", "Cylinder", "Mobius Strip", "[back]"];
		current_pos_target = scr_menu(options, current, 0);
		break;
	
	// Options menu
	case 2:
		current_pos_target = scr_options(current);
		break;
	
	// Credits
	case 3:
		current_pos_target = scr_credits();
		break;
	
	// Quit confirmation
	case 4:
		options = ["Are you sure you want to quit?", "[quit]", "[back]"];
		current_pos_target = scr_menu(options, current, 0);
		break;
	
	// Torus
	case 5:
		draw_text_color(room_width/2, 60, "Torus", cy, cy, cy, cy, 1);
		draw_sprite_ext(spr_polyhedron_torus, 0, room_width/2, room_height/3, 2, 2, 5*cos(current_time*0.002), cw, 1);
		options = ["Select difficulty:", "Free Play", "Normal", "Hard", "[back]"];
		current_pos_target = scr_menu(options, current, 120);
		break;
	
	// Klein
	case 6:
		draw_text_color(room_width/2, 60, "Klein Bottle", cy, cy, cy, cy, 1);
		draw_sprite_ext(spr_polyhedron_klein, 0, room_width/2, room_height/3, 2, 2, 5*cos(current_time*0.002), cw, 1);
		options = ["Select difficulty:", "Free Play", "Normal", "Hard", "[back]"];
		current_pos_target = scr_menu(options, current, 120);
		break;
	
	// Sphere
	case 7:
		draw_text_color(room_width/2, 60, "Sphere", cy, cy, cy, cy, 1);
		draw_sprite_ext(spr_polyhedron_sphere, 0, room_width/2, room_height/3, 2, 2, 5*cos(current_time*0.002), cw, 1);
		options = ["Select difficulty:", "Free Play", "Normal", "Hard", "[back]"];
		current_pos_target = scr_menu(options, current, 120);
		break;
	
	// RPP
	case 8:
		draw_text_color(room_width/2, 60, "Real Projective Plane", cy, cy, cy, cy, 1);
		draw_sprite_ext(spr_polyhedron_rpp, 0, room_width/2, room_height/3, 2, 2, 5*cos(current_time*0.002), cw, 1);
		options = ["Select difficulty:", "Free Play", "Normal", "Hard", "[back]"];
		current_pos_target = scr_menu(options, current, 120);
		break;
	
	// Cylinder
	case 9:
		draw_text_color(room_width/2, 60, "Cylinder", cy, cy, cy, cy, 1);
		draw_sprite_ext(spr_polyhedron_cylinder, 0, room_width/2, room_height/3, 2, 2, 5*cos(current_time*0.002), cw, 1);
		options = ["Select difficulty:", "Free Play", "Normal", "Hard", "[back]"];
		current_pos_target = scr_menu(options, current, 120);
		break;
	
	// Mobius
	case 10:
		draw_text_color(room_width/2, 60, "Mobius Strip", cy, cy, cy, cy, 1);
		draw_sprite_ext(spr_polyhedron_torus, 0, room_width/2, room_height/3, 2, 2, 5*cos(current_time*0.002), cw, 1);
		options = ["Select difficulty:", "Free Play", "Normal", "Hard", "[back]"];
		current_pos_target = scr_menu(options, current, 120);
		break;
	
	// Score delete confirmation
	case 11:
		options = ["Delete saved high scores?", "[confirm]", "[back]"];
		current_pos_target = scr_menu(options, current, 0);
		break;
}

// Draw clear confirmation (disappears by itself over time)
draw_text_color(room_width/2, 60, "Scores deleted.", cr, cr, cr, cr, clear_confirmation);
