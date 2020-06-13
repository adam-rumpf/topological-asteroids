/// @func scr_options(current)
/// @desc Displays the choices on the Options screen. Returns the location of the current button.
/// @param {int} current The array index of the current option.

// Rename arguments
var current = argument[0];

// Set text font and define colors
draw_set_font(fnt_consolas);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var cw = c_white;
var cy = c_yellow;

// Define lines of options (leave a space for the volume control)
var options = ["Controls:",
"[Arrows]/[WASD] -- move, navigate menus",
"[Space]/[Enter] -- shoot, accept menu option",
"[Esc]/[P] -- pause",
"[Esc] -- back out of menu option",
" ",
"Options:",
"Sound volume: " + string(global.sound_volume),
"Reset high scores",
"[back]"];

// Get list length
var num = array_length_1d(options);
var current_pos = -1;

// Draw each list item
for (var i = 0; i < num; i++)
{
	// Calculate vertical position
	var pos = (room_height/2) - (15*(num-1)) + (30*i);
	
	// Default style
	if (i != current)
		draw_text_color(room_width/2, pos, options[i], cw, cw, cw, cw, 1);
	// Selected style
	else
	{
		current_pos = pos;
		draw_text_color(room_width/2, pos, options[i], cy, cy, cy, cy, 1);
		
		// If the sound option is selected, draw arrows
		if (i == 7)
		{
			draw_sprite_ext(spr_arrow, 0, (room_width/2) - 120 - 5*cos(current_time*0.01), pos, 1, 1, 180, c_white, 1);
			draw_sprite_ext(spr_arrow, 0, (room_width/2) + 120 + 5*cos(current_time*0.01), pos, 1, 1, 0, c_white, 1);
		}
	}
}

return current_pos
