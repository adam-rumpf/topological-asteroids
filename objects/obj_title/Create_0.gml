/// @desc Title screen controller initialization.

// Set text font
draw_set_font(fnt_arial);

/*
Set state variable to indicate position in menu structure. Sate IDs include:
	+(0) Default main menu
	+-+(1) Play
	| +-+(4) Torus
	| +-+(5) Klein
	| +-+(6) Sphere
	| +-+(7) RPP
	| +-+(8) Cylinder
	| +-+(9) Mobius
	+-+(2) Options
	+-+(3) Quit confirmation
*/
state = 0; // always begin on main menu
