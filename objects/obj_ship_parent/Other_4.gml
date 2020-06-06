/// @desc Spawn ship objects and remember their IDs.

// Array of child IDs
ships = scr_spawn(obj_ship, id, 0, global.cell_size/2, global.cell_size/2, 90, 1);
dead = false; // toggled by a child to indicate that one has died
