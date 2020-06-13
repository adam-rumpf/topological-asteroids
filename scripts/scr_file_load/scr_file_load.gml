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
	audio_master_gain(global.sound_volume/10);
	ini_close();
}

// Scores
if (file_exists(scores))
{
	var f = file_text_open_read(scores);
	for (var i = 0; i < 6; i++)
	{
		global.high_scores[i,0] = real(base64_decode(file_text_read_string(f)));
		file_text_readln(f);
		global.high_scores[i,1] = real(base64_decode(file_text_read_string(f)));
		file_text_readln(f);
	}
	file_text_close(f);
}
