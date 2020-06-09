/// @desc Destroy self on title screen.

if (room = rm_title)
{
	// Update best score
	global.high_scores[rid,did] = highest_score;
	
	// Then destroy self
	instance_destroy();
}
