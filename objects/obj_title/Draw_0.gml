/// @desc Draw text on title screen.

//### Temporary control to go to torus room.
draw_set_halign(fa_center);
draw_text_color(room_width/2, room_height/2, "Press [1] to go to the torus test room.", c_white, c_white, c_white, c_white, 1);
draw_text_color(room_width/2, (room_height/2)+30, "Press [2] to go to the Klein test room.", c_white, c_white, c_white, c_white, 1);
draw_text_color(room_width/2, (room_height/2)+60, "Press [3] to go to the sphere test room.", c_white, c_white, c_white, c_white, 1);
draw_text_color(room_width/2, (room_height/2)+90, "Press [4] to go to the RPP test room.", c_white, c_white, c_white, c_white, 1);
