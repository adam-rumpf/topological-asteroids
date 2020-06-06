/// @desc Center window and get target ship.

if (instance_exists(obj_ship_parent))
	camera_target = obj_ship_parent.base;
window_center();
