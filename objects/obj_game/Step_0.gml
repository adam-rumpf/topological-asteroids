/// @desc Background game processes and keyboard listeners.

//### Eventually replace this with a pause menu and a quit confirmation.
// Quit on [Esc] press.
if (keyboard_check_pressed(vk_escape))
	game_end();

//### Have this object control the sounds, to prevent too many from playing at once.
