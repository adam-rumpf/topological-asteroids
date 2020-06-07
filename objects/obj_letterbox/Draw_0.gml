/// @desc Black out space above and below strip.

draw_rectangle_color(0, 0, room_width, global.cell_size-2, c_black, c_black, c_black, c_black, false);
draw_rectangle_color(0, 2*global.cell_size+2, room_width, room_height, c_black, c_black, c_black, c_black, false);
