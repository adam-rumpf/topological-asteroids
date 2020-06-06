/// @func scr_debris(x, y, dir)
/// @desc Creates a deterministic pattern of debris in order to preserve symmetry.
/// @param {real} x Horizontal coordinate of pattern origin.
/// @param {real} y Vertical coordinate of pattern origin.
/// @param {real} dir Alignment direction (degrees) for debris pattern.

// Rename arguments
var xx, yy, dir;
xx = argument[0];
yy = argument[1];
dir = argument[2];

// Main +
for (var i = 0; i < 4; i++)
{
	var debris = instance_create_layer(xx, yy, "Instances", obj_debris);
	debris.direction = dir + 90*i;
	debris.speed = 0.05*room_speed;
}

// Smaller X
for (var i = 0; i < 4; i++)
{
	var debris = instance_create_layer(xx, yy, "Instances", obj_debris);
	debris.direction = dir + 45 + 90*i;
	debris.speed = 0.025*room_speed;
}
