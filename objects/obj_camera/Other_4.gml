/// @desc Set up default viewport for room.

// Camera attributes
camera_locked_x = global.cell_size; // fundamental polygon position
camera_locked_y = global.cell_size;
camera_zoom_x = global.cell_size/2; // zoomed out position
camera_zoom_y = global.cell_size/2;
camera_small_width = global.cell_size; // fundamental polygon and following size
camera_small_height = global.cell_size;
camera_large_width = 2*global.cell_size; // zoomed out size
camera_large_height = 2*global.cell_size;
camera_target = id; // object to track
camera_x = global.cell_size; // current coordinates
camera_y = global.cell_size;

// Enable viewports only for game rooms
if (room != rm_title)
{
	view_enabled = true;

	// Set up fundamental polygon camera
	view_visible[0] = true;
	camera_set_view_size(view_camera[0], camera_small_width, camera_small_height);
	camera_set_view_pos(view_camera[0], camera_locked_x, camera_locked_y);
}

// Display attributes
display_width = global.view_scale * camera_small_width;
display_height = global.view_scale * camera_small_height;

// Set window size
window_set_size(display_width, display_height);
surface_resize(application_surface, display_width, display_height);

// Set alarm to delay window resize and target gathering
alarm[0] = 1;
