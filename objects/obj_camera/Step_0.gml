/// @desc Control camera depending on mode.

switch global.camera
{
	// Fundamental polygon
	case 0:
		camera_set_view_size(view_camera[0], camera_small_width, camera_small_height);
		camera_set_view_pos(view_camera[0], camera_locked_x, camera_locked_y);
		break;
	
	// Follow ship
	case 1:
		// Update coordinates
		if (instance_exists(camera_target))
		{
			camera_x = camera_target.x - global.cell_size/2;
			camera_y = camera_target.y - global.cell_size/2;
		}
		camera_set_view_size(view_camera[0], camera_small_width, camera_small_height);
		camera_set_view_pos(view_camera[0], camera_x, camera_y);
		break;
	
	// Zoomed out
	case 2:
		camera_set_view_size(view_camera[0], camera_large_width, camera_large_height);
		camera_set_view_pos(view_camera[0], camera_zoom_x, camera_zoom_y);
		break;
	
	//### Test
	case 3:
		camera_set_view_size(view_camera[0], room_width, room_height);
		camera_set_view_pos(view_camera[0], 0, 0);
		break;
}
