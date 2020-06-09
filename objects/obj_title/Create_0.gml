/// @desc Title screen controller initialization.

// Set text font
draw_set_font(fnt_arial);

/*
Set state variable to indicate position in menu structure. Sate IDs include:
	+(0) Default main menu
	+-+(1) Play (present options for all game rooms)
	+-+(2) Options (sound and difficulty settings)
	+-+(3) Controls (display controls)
	+-+(4) Quit confirmation
*/
state = 0; // always begin on main menu
