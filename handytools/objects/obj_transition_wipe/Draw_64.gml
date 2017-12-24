draw_set_colour( colour );
draw_triangle( x, y, x, y+room_height, x-room_width, y+room_height, false );
draw_rectangle( x, y, x+room_width, y+room_height, false );
draw_triangle( x+room_width, y, x+room_width, y+room_height, x+2*room_width, y, false );
draw_set_colour( c_white );