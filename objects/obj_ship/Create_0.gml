/// @desc Initialization for player object.

// Set other attributes
turn_speed = 6*(60/room_speed); // angle increment while pressing turn key
acceleration = 0.05*(60/room_speed); // speed increment while accelerating
can_shoot = true; // used to limit ship's fire rate
cooldown = room_speed*0.3; // time required between firing
mirrored = false; // whether or not this is mirrored relative to the base room

//### Expand image size for testing purposes
image_xscale = 2;
image_yscale = 2;
