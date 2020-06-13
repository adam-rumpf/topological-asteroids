/// @desc Draw pause screen.

if (paused == true)
{
	var w = display_get_gui_width();
	var h = display_get_gui_height();
	
	if (surface_exists(pause_screen) == false)
	{
		// Pause game
		if (pause_screen == -1)
			instance_deactivate_all(true);
		
		// Create pause screen
		pause_screen = surface_create(w, h);
		surface_set_target(pause_screen);
		draw_surface(application_surface, 0, 0);
		surface_reset_target();
	}
	else
	{
		var cb = c_black;
		var cw = c_white;
		
		// Draw pause screen
		draw_surface(pause_screen, 0, 0);
		draw_set_alpha(0.5);
		draw_rectangle_color(0, 0, w, h, cb, cb, cb, cb, false);
		draw_set_alpha(1);
		draw_set_halign(fa_center);
		draw_text_color(w/2, (h/2)-15, "Press [P] to unpause.", cw, cw, cw, cw, 1);
		draw_text_color(w/2, (h/2)+15, "Press [Esc] to quit.", cw, cw, cw, cw, 1);
		draw_set_halign(fa_left);
	}
}
