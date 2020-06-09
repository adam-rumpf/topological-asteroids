/// @desc Spawn ship parent and start score timer.

// Spawns player objects
instance_create_layer(x, y, "Instances", obj_ship_parent);

// Starts a timer for gaining points over time
alarm[1] = 0.1*room_speed;
