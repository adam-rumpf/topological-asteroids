/// @desc Control actions on title screen.

//### Temporary code to enter test room from menu.
if (keyboard_check_pressed(ord("T")))
	room_goto(rm_torus);
if (keyboard_check_pressed(ord("K")))
	room_goto(rm_klein);
