/// @func scr_file_save()
/// @desc Save scores and settings to external files (or create them if they do not exist).

// File names
var settings = "settings.ini";
var scores = "scores.dat";

// Settings
if (file_exists(settings))
	file_delete(settings);
ini_open(settings);
ini_write_real("option", "sound", global.sound_volume);
ini_write_real("option", "difficulty", global.difficulty);
ini_close();

// Scores
if (file_exists(scores))
	file_delete(scores);
var map = ds_map_create();
for (var i = 0; i < 6; i++)
{
	ds_map_add(map, "r0"+string(i), global.high_scores[i,0]);
	ds_map_add(map, "r1"+string(i), global.high_scores[i,1]);
}
ds_map_secure_save(map, scores);
