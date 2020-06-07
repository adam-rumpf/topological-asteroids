/// @desc Spawn an asteroid and reset timer.

//###
instance_create_layer(x, y, "Instances", obj_asteroid_parent);

// Reset timer to spawn next asteroid
//###
//alarm[0] = delay*room_speed;

//### Later add code to speed this up.
