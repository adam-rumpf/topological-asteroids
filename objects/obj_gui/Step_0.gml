/// @desc Listen for the first camera change and edit the tip.

if (keyboard_check_pressed(ord("C")))
	global.changed_camera = true;

if (global.changed_camera == true)
	camera_tip -= 0.01 * (60/room_speed);

if (camera_tip < 0)
	camera_tip = 0;
