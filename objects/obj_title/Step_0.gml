/// @desc Control actions on title screen.

//### Temporary code to enter test room from menu.
if (room == rm_title && keyboard_check_pressed(ord("N")))
	room_goto(rm_torus);
