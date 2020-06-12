/// @desc Title screen controller initialization.

/*
Set state variable to indicate position in menu structure. Sate IDs include:
	+(0) Default main menu
	+-+(1) Play (present options for all game rooms)
	| +-+(5) Options for torus (difficulty, option to back out)
	| +-+(6) Options for Klein
	| +-+(7) Options for sphere
	| +-+(8) Options for RPP
	| +-+(9) Options for cylinder
	| +-+(10) Options for Mobius
	+-+(2) Options (sound settings, view controls)
	+-+(3) Credits
	+-+(4) Quit confirmation
*/
menu = 0; // always begin on main menu

// Set a variable to indicate the current menu option
current = 0;
current_pos_target = -1; // vertical coordinate of current option (negative if N/A)
current_pos = -1; // vertical coordinate currently being drawn
