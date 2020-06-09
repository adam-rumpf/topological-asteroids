/// @func scr_file_load()
/// @desc Load scores and settings from external files (or create them if they do not exist).

// File names
var settings = "settings.ini";
var scores = "scores.dat";

// Settings
if (file_exists(settings))
{
	ini_open(settings);
	global.sound_volume = ini_read_real("option", "sound", 5);
	global.difficulty = ini_read_real("option", "difficulty", 1);
	ini_close();
}

// Scores
if (file_exists(scores))
{
	var map = ds_map_secure_load(scores);
	for (var i = 0; i < 6; i++)
	{
		global.high_scores[i,0] = ds_map_find_value(map, "r0"+string(i));
		global.high_scores[i,1] = ds_map_find_value(map, "r1"+string(i));
	}
}
