/// @desc Spawn asteroid objects and remember their IDs.

// Pick a random rotation speed, position, and angle
var xx, yy, dir;
xx = irandom(global.cell_size-1);
yy = irandom(global.cell_size-1);
dir = irandom(359);

// Pick a random size and speed
var spd, asteroid;
switch irandom_range(1, 3)
{
	// Small
	case 1:
		asteroid = obj_asteroid_small;
		spd = (choose(-1, 1) * random_range(1, 3)) * (60/room_speed);
		break;
	
	// Medium
	case 2:
		asteroid = obj_asteroid_medium;
		spd = (choose(-1, 1) * random_range(0.75, 2.5)) * (60/room_speed);
		break;
	
	// Large
	case 3:
		asteroid = obj_asteroid_large;
		spd = (choose(-1, 1) * random_range(0.5, 2)) * (60/room_speed);
		break;
}

// Spawn an array of warning objects
asteroids = scr_spawn(obj_warning, id, global.symmetry, xx, yy, 0, 0);

// Array of child IDs
asteroids = scr_spawn(asteroid, id, global.symmetry, xx, yy, dir, spd);
dead = false; // toggled by a child to indicate that one has died
