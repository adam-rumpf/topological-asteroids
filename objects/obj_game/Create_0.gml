/// @desc Initialization code for game.

// Set random seed
randomize();

// Define global variables
global.cell_size = 640; // sice of unit cell (px)
global.cell_num = 4; // number of cells in each dimension of the game room
global.warning_time = 2; // time between warning and asteroid spawning (sec)
global.view_scale = 1; // scale for display size

/*
Set symmetry type. Type IDs include:
	0 -- torus
	1 -- Klein bottle
	2 -- sphere
	3 -- real projective plane
	4 -- cylinder
	5 -- Mobius strip
*/
global.symmetry = 0;

/*
Set camera mode. Mode IDs include:
	0 -- locked to fundamental polygon
	1 -- follow ship
	2 -- zoomed out
	3 -- entire room (2D symmetries only)
*/
global.camera = 0;

/*
Set difficulty level. Difficulty IDs include:
	0 -- free play
	1 -- normal
	2 -- hard
*/
global.difficulty = 1;
