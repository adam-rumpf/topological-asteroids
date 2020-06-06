/// @desc Initialization for asteroid object.

// Set attributes
turn_speed = 1; // angle increment per step
parent = id; // ID of asteroid parent object

// Set timer until becoming active
alarm[0] = global.warning_time*room_speed;
