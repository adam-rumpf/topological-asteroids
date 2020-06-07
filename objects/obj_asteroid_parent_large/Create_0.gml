/// @desc Spawn a large asteroid.

// Pick a random rotation speed, position, and angle
var xx, yy, dir;
xx = irandom(global.cell_size-1);
yy = irandom(global.cell_size-1);
dir = irandom(359);
dead = false; // toggled by a child to indicate that one has died

// Pick a random speed
var spd, type;
size = 2;
type = obj_asteroid_large;
spd = (choose(-1, 1) * random_range(0.5, 2)) * (60/room_speed);

// Spawn an array of warning objects
asteroids = scr_spawn(obj_warning, id, global.symmetry, xx, yy, 0, 0);

// Spawn an array of asteroids
asteroids = scr_spawn(type, id, global.symmetry, xx, yy, dir, spd);
