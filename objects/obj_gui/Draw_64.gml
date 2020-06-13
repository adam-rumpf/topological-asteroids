// @desc Draw lives and score on GUI.

// Set text format
draw_set_font(fnt_consolas);
draw_set_halign(fa_left);
var cw = c_white;
var bc = c_white;

// Draw camera tip
draw_text_color(30, display_get_gui_height()-50, "Press [C] to change camera mode.", cw, cw, cw, cw, camera_tip);

// No GUI for free play mode
if (global.difficulty == 0)
	exit;

// Set text font and set colors
if (score >= highest_score)
{
	// Change best score color if currently setting a record
	bc = c_yellow;
	highest_score = score;
}

// Draw GUI elements
draw_text_color(30, 30, "Score: " + string(score), cw, cw, cw, cw, 1);
draw_text_color(30, 60, "Best: " + string(highest_score), bc, bc, bc, bc, 1);
draw_text_color(30, 90, "Lives: " + string(lives), cw, cw, cw, cw, 1);
