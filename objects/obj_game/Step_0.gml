/// @desc Background game processes and keyboard listeners.

//### Eventually replace this with a pause menu and a quit confirmation.
// On [Esc] press, either go to the title scren or exit.
if (keyboard_check_pressed(vk_escape) && room != rm_title)
	room_goto(rm_title);

// [C] pressed -- change camera mode
if (keyboard_check_pressed(ord("C")))
{
	global.camera = (global.camera+1) % 4;
	if (room == rm_cylinder || room = rm_mobius)
		global.camera = global.camera % 3;
}
