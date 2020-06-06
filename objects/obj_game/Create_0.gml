/// @desc Initialization code for game.

// Defining global variables.
global.cell_size = 640; // sice of unit cell (px)
global.cell_num = 4; // number of cells in each dimension of the game room

/*
Set symmetry type. Type IDs include:
	0 -- torus
	1 -- Klein bottle
	2 -- sphere
	3 -- real projective plane
	4 -- cylinder
	5 -- Mobius strip
*/
symmetry = 0;

/*
Set camera mode. Mode IDs include:
	0 -- locked to fundamental polygon
	1 -- follow ship
	2 -- zoomed out
*/
camera = 0;
