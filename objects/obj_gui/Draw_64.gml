// @desc Draw lives and score on GUI.

// Set text font and set colors
draw_set_font(fnt_consolas);
var cw = c_white;
var bc = c_white;
if (score >= highest_score)
{
	// Change best score color if currently setting a record
	bc = c_yellow;
	highest_score = score;
}

// Draw GUI elements
draw_set_halign(fa_left);
draw_text_color(30, 30, "Score: " + string(score), cw, cw, cw, cw, 1);
draw_text_color(30, 60, "Best: " + string(highest_score), bc, bc, bc, bc, 1);
if (global.difficulty != 0)
	draw_text_color(30, 90, "Lives: " + string(lives), cw, cw, cw, cw, 1);
