/// @desc Control actions on title screen.

//### Temporary code to enter test room from menu.
if (keyboard_check_pressed(ord("1")))
	room_goto(rm_torus);
if (keyboard_check_pressed(ord("2")))
	room_goto(rm_klein);
if (keyboard_check_pressed(ord("3")))
	room_goto(rm_sphere);
if (keyboard_check_pressed(ord("4")))
	room_goto(rm_sphere);
