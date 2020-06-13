/// @desc Initialization code for game.

// Set random seed
randomize();

// Define global variables
global.cell_size = 640; // sice of unit cell (px)
global.cell_num = 4; // number of cells in each dimension of the game room
global.warning_time = 2; // time between warning and asteroid spawning (sec)
global.view_scale = 1; // scale for display size
global.sound_volume = 5; // current volume of sound effects (read from settings.ini)
global.alive = false; // whether the player is currently alive
global.changed_camera = false; // whether the user has changed the camera this session

// Define high score array (read from scores.sav)
global.high_scores = 0;
for (var i = 0; i < 6; i++)
{
	global.high_scores[i,0] = 0;
	global.high_scores[i,1] = 0;
}

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

// Variables for a pause screen
paused = false;
pause_screen = -1; // ID of pause screen surface to draw to

// Load files
scr_file_load();
