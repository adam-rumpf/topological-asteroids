/// @func scr_credits()
/// @desc Displays the credits along with a "back" button. Returns the location of the button.

// Set text font and define colors
draw_set_font(fnt_consolas);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var cw = c_white;
var cy = c_yellow;

// Define lines of credits
var credits = ["Topological Asteroids",
"Copyright (c) 2020 Adam Rumpf",
"adam-rumpf.github.io",
" ",
"Source code released under MIT License",
"github.com/adam-rumpf/topological-asteroids",
" ",
"Made in GameMaker Studio 2",
"2017 YoYo Games Ltd",
" ",
"Sound effects made in Bfxr",
"bfxr.net",
" ",
"[back]"];

// Get list length
var num = array_length_1d(credits);
var current_pos = -1;

// Draw each list item
for (var i = 0; i < num; i++)
{
	// Calculate vertical position
	var pos = (room_height/2) - (15*(num-1)) + (30*i);
	
	// Default style
	if (i < num-1)
		draw_text_color(room_width/2, pos, credits[i], cw, cw, cw, cw, 1);
	// Selected style
	else
	{
		current_pos = pos;
		draw_text_color(room_width/2, pos, credits[i], cy, cy, cy, cy, 1);
	}
}

return current_pos
