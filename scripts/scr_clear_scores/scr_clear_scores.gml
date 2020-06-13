/// @func scr_clear_scores()
/// @desc Deletes score file and clears all current scores.

// File names
var scores = "scores.dat";

// Delete score file
if (file_exists(scores))
	file_delete(scores);

// Clear current score table
score = 0;
for (var i = 0; i < 6; i++)
{
	global.high_scores[i,0] = 0;
	global.high_scores[i,1] = 1;
}
