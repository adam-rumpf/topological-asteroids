/// @func scr_menu(options, current)
/// @desc Display a given list of menu options. Returns the vertical coordinate of the selected option.
/// @param {string[]} options An array of strings to display as options.
/// @param {int} current The array index of the current option.

// Rename arguments
var options, current;
options = argument[0];
current = argument[1];

// Set text font and define colors
draw_set_font(fnt_consolas);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var cw = c_white;
var cy = c_yellow;

// Get list length and quit if empty
var num = array_length_1d(options);
var current_pos = -1;
if (num == 0)
	return current_pos;

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
	}
}

return current_pos
