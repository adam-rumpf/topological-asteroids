/// @desc Background game processes and keyboard listeners.

//### Eventually replace this with a pause menu and a quit confirmation.
// On [Esc] press, either go to the title scren or exit.
if (keyboard_check_pressed(vk_escape))
{
	if (room == rm_title)
		game_end();
	else
		room_goto(rm_title);
}

//### Have this object control the sounds, to prevent too many from playing at once.
