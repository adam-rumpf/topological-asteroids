/// @desc Create debris and an invisible bullet absorber on death.

scr_debris(x, y, image_angle);

var blocker = instance_create_layer(x, y, "Instances", obj_blocker);
blocker.image_angle = image_angle;
