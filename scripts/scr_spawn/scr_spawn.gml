/// @func scr_spawn(obj, xx, yy, dir)
/// @desc Spawn an array of objects with the necessary symmetries applied and return array of instance IDs.
/// @param {obj} object Object type to be spawned.
/// @param {real} xx Horizontal coordinate of object relative to base cell (1 down, 1 right).
/// @param {real} yy Vertical coordinate of object relative to base cell (1 down, 1 right).
/// @param {real} dir Initial direction of object within the base room.

// Rename arguments
var obj, xx, yy, dir;
obj = argument[0];
xx = argument[1];
yy = argument[2];
dir = argument[3];

// Initialize an array of instance IDs
var ids;
for (var i = 0; i < global.cell_num; i += 1)
{
	for (var j = 0; j < global.cell_num; j += 1)
		ids[i,j] = 0;
}

//### This will need to be replaced with cases and a loop to spawn all instances.
var instance = instance_create_layer(global.cell_size+xx, global.cell_size+yy, "Instances", obj);
instance.direction = dir;
instance.image_angle = dir;
ids[1,1] = instance;

//### Note: Set instance.mirrored = true and set instance.image_xscale = -instance.image_xscale to mirror an object.

return ids;
