/// @desc Initialization for player object.

// Set attributes
turn_speed = 6*(60/room_speed); // angle increment while pressing turn key
acceleration = 0.05*(60/room_speed); // speed increment while accelerating
parent = id; // ID of ship parent object

//### Expand image size for testing purposes
image_xscale = 2;
image_yscale = 2;
