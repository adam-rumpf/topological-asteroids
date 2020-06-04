/// @desc Initialization for standard player object.

// Set default direction
direction = 90;
image_angle = 90;

// Set other attributes
turn_speed = 6; // angle increment while pressing turn key
acceleration = 0.05; // speed increment while accelerating
can_shoot = true; // used to limit ship's fire rate
cooldown = room_speed*0.3; // time required between firing
