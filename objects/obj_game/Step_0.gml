/// @desc Background game processes and keyboard listeners.

//### Eventually replace this with a pause menu and a quit confirmation.
// Quit on [Esc] press.
if (keyboard_check_pressed(vk_escape))
	game_end();

//### Temporary code to enter test room from menu.
if (room == rm_title && keyboard_check_pressed(ord("N")))
	room_goto(rm_torus);
