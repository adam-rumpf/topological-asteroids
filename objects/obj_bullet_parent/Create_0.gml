/// @desc Spawn bullet objects and remember their IDs.

// Array of child IDs
//### Need to figure out how to get the position and direction.
bullets = scr_spawn(obj_bullet, id, global.symmetry, x, y, 0, 10);
dead = false; // toggled by a child to indicate that one has died

// Set death timer for self and bullets
alarm[0] = room_speed*6;
