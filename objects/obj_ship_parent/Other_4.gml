/// @desc Spawn ship objects and remember their IDs.

// Start scoring
global.alive = true;

// Array of child IDs
ships = scr_spawn(obj_ship, id, global.symmetry, global.cell_size/2, global.cell_size/2, 90, 1);
base = ships[1, 1]; // ID of the "main" ship, from cell (1, 1)
dead = false; // toggled by a child to indicate that one has died

// Bullet-related variables
can_shoot = true; // whether the player can shoot
cooldown = room_speed*0.3; // time required between firing
