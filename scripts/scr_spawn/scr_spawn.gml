/// @func scr_spawn(obj, par, sym, xx, yy, dir, spd)
/// @desc Spawn an array of objects with the necessary symmetries applied and return array of instance IDs.
/// @param {object} obj Object type to be spawned.
/// @param {real} par Parent object ID.
/// @param {int} sym Symmetry ID.
/// @param {real} xx Horizontal coordinate of object relative to base cell (1 down, 1 right).
/// @param {real} yy Vertical coordinate of object relative to base cell (1 down, 1 right).
/// @param {real} dir Initial direction of object within the base room.
/// @param {real} spd Turning speed multiplier relative to base speed.

// Rename arguments
var obj, par, sym, xx, yy, dir, spd;
obj = argument[0];
par = argument[1];
sym = argument[2];
xx = argument[3];
yy = argument[4];
dir = argument[5];
spd = argument[6];

// Initialize an array of instance IDs
var ids;
for (var i = 0; i < global.cell_num; i++)
{
	for (var j = 0; j < global.cell_num; j++)
		ids[i,j] = 0;
}

// Break into cases depending on room symmetry
switch sym
{
	// Torus
	case 0:
		for (var i = 0; i < global.cell_num; i++)
		{
			for (var j = 0; j < global.cell_num; j++)
			{
				var instance, xxx, yyy;
				
				// Offset coordinates
				xxx = xx + j*global.cell_size;
				yyy = yy + i*global.cell_size;
				
				// Create instance and store ID
				instance = instance_create_layer(xxx, yyy, "Instances", obj);
				ids[i,j] = instance;
				
				// Set instance attributes
				instance.direction = dir;
				instance.image_angle = dir;
				instance.turn_speed *= spd;
				instance.parent = par;
			}
		}
		break;
	
	// Klein bottle
	case 1:
		for (var i = 0; i < global.cell_num; i++)
		{
			for (var j = 0; j < global.cell_num; j++)
			{
				var instance, xxx, yyy;
				
				// Offset coordinates
				xxx = xx + j*global.cell_size;
				if (j%2 == 1)
					// Default
					yyy = yy + i*global.cell_size;
				else
					// Mirrored over horizontal axis
					yyy = global.cell_size - yy + i*global.cell_size;
				
				// Create instance and store ID
				instance = instance_create_layer(xxx, yyy, "Instances", obj);
				ids[i,j] = instance;
				
				// Set instance attributes
				if (j%2 == 1)
				{
					// Default
					instance.direction = dir;
					instance.image_angle = dir;
					instance.turn_speed *= spd;
				}
				else
				{
					// Mirrored over horizontal axis
					instance.image_yscale *= -1;
					instance.direction = -dir;
					instance.image_angle = -dir;
					instance.turn_speed *= -spd;
				}
				instance.parent = par;
			}
		}
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

//### Note: Set instance.turn_speed *= -spd and set instance.image_xscale = -instance.image_xscale to mirror an object.

// Return array of instance IDs
return ids;
