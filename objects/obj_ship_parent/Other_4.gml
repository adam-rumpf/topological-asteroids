/// @desc Spawn ship objects and remember their IDs.

// Array of child IDs
ships = scr_spawn(obj_ship, id, global.symmetry, -100+global.cell_size/2, -200+global.cell_size/2, 75, 1);
dead = false; // toggled by a child to indicate that one has died
