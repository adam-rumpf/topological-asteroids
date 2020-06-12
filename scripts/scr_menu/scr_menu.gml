/// @func scr_menu(options, current)
/// @desc Display a given list of menu options.
/// @param {string[]} options An array of strings to display as options.
/// @param {int} current The array index of the current option.

// Rename arguments
var options, current;
options = argument[0];
current = argument[1];

// Set text font and define colors
draw_set_font(fnt_consolas);
draw_set_halign(fa_center);
var cw = c_white;
var cy = c_yellow;

// 0
// -15, 15
// -30, 0, 30
// -45, -15, 15, 45

// Draw each menu option
var num = array_length_1d(options);
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
		draw_text_color(room_width/2, pos, options[i], cy, cy, cy, cy, 1);
	}
}
