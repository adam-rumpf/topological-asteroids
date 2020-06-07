/// @desc Spawn asteroid objects and remember their IDs.

// Pick a random rotation speed, position, and angle
var xx, yy, dir, ship;
do
{
	// Avoid spawning on top of the player
	xx = irandom(global.cell_size-1);
	yy = irandom(global.cell_size-1);
	ship = instance_nearest(xx, yy, obj_ship);
}
until (point_distance(xx, yy, ship.x, ship.y) > 2*ship.sprite_width);
dir = irandom(359);

// Pick a random size and speed
var spd, asteroid;
switch irandom_range(1, 3)
{
	//### Implement other cases later. Make smaller asteroids faster.
	
	// Small
	case 1:
	
	// Medium
	case 2:
	
	// Large
	case 3:
		asteroid = obj_asteroid_large;
		spd = (choose(-1, 1) * random_range(0.5, 2)) * (60/room_speed);
}

// Spawn an array of warning objects
asteroids = scr_spawn(obj_warning, id, global.symmetry, xx, yy, 0, 0);

// Array of child IDs
asteroids = scr_spawn(asteroid, id, global.symmetry, xx, yy, dir, spd);
dead = false; // toggled by a child to indicate that one has died
