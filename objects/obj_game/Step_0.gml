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

// [C] pressed -- change camera mode
//###
if (keyboard_check_pressed(ord("C")))
	//global.camera = (global.camera+1) % 3;
	global.camera = (global.camera+1) % 4;
