/// @desc Spawn bullet objects and remember their IDs.

// Array of child IDs (to be filled by ship object)
bullets = 0;
dead = false; // toggled by a child to indicate that one has died

// Set death timer for self and bullets
alarm[0] = room_speed*6;
