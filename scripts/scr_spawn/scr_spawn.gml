/// @func scr_spawn(obj, xx, yy, dir, spd)
/// @desc Spawn an array of objects with the necessary symmetries applied and return array of instance IDs.
/// @param {obj} object Object type to be spawned.
/// @param {real} xx Horizontal coordinate of object relative to base cell (1 down, 1 right).
/// @param {real} yy Vertical coordinate of object relative to base cell (1 down, 1 right).
/// @param {real} dir Initial direction of object within the base room.
/// @param {real} spd Turning speed multiplier relative to base speed.

// Rename arguments
var obj, xx, yy, dir, spd;
obj = argument[0];
xx = argument[1];
yy = argument[2];
dir = argument[3];
spd = argument[4];

// Initialize an array of instance IDs
var ids;
for (var i = 0; i < global.cell_num; i += 1)
{
	for (var j = 0; j < global.cell_num; j += 1)
		ids[i,j] = 0;
}

// Break into cases depending on room symmetry
switch global.symmetry
{
	// Torus
	case 0:
		for (var i = 0; i < global.cell_num; i += 1)
		{
			for (var j = 0; j < global.cell_num; j += 1)
			{
				var instance = instance_create_layer(i*global.cell_size + xx, j*global.cell_size + yy, "Instances", obj);
				instance.direction = dir;
				instance.image_angle = dir;
				instance.turn_speed *= spd;
				ids[i,j] = instance;
			}
		}
		break;
	
	// Klein bottle
	case 1:
		break;
	
	// Sphere
	case 2:
		break;
	
	// Real projective plane
	case 3:
		break;
	
	// Cylinder
	case 4:
		break;
	
	// Mobius strip
	case 5:
		break;
}

//### Note: Set instance.mirrored = true and set instance.image_xscale = -instance.image_xscale to mirror an object.

return ids;
