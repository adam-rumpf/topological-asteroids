/// @desc Background game processes and keyboard listeners.

if (room == rm_title)
	exit;

// Pause/unpause events
if (paused == false)
{
	// [Esc] or [P] (while unpaused) -- pause screen
	if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("P")))
	{
		audio_master_gain(0);
		paused = true;
		pause_screen = -1;
	}
}
else
{
	// [P] (while paused) -- unpause
	if (keyboard_check_pressed(ord("P")))
	{
		audio_master_gain(global.sound_volume/10);
		instance_activate_all();
		paused = false;
	}

	// [Esc] (while paused) -- return to previous screen
	if (keyboard_check_pressed(vk_escape))
	{
		score = 0;
		audio_master_gain(global.sound_volume/10);
		instance_activate_all();
		scr_return_game();
	}
}

// [C] pressed -- change camera mode
if (keyboard_check_pressed(ord("C")))
{
	global.camera = (global.camera+1) % 4;
	if (room == rm_cylinder || room = rm_mobius)
		global.camera = global.camera % 3;
}
