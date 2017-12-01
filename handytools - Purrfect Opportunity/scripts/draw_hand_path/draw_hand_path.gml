/// @param colour
/// @param width

var _colour = argument0;
var _width  = argument1;

draw_set_colour( _colour );
draw_primitive_begin( pr_trianglestrip );

draw_vertex( root_x-_width, room_height );
draw_vertex( root_x+_width, room_height );
	
if ( ds_list_size( path ) > 0 ) {
	
	var _i = 0;
	var _x = path[| _i   ];
	var _y = path[| _i+1 ];
	draw_vertex( _x-_width, _y+16 );
	draw_vertex( _x+_width, _y+16 );

	var _size = ds_list_size( path );
	for( var _i = 2; _i < _size-2; _i += 2 ) {
		
		var _ax = path[| _i-2 ];
		var _ay = path[| _i-1 ];
		var _bx = path[| _i+2 ];
		var _by = path[| _i+3 ];
		
		var _dir = point_direction( _ax, _ay, _bx, _by );
		
		var _x = path[| _i   ];
		var _y = path[| _i+1 ]+16;
		
		var _r_ax = _x + lengthdir_x( _width, _dir+90 );
		var _r_ay = _y + lengthdir_y( _width, _dir+90 );
		var _r_bx = _x + lengthdir_x( _width, _dir-90 );
		var _r_by = _y + lengthdir_y( _width, _dir-90 );
		
		draw_vertex( _r_ax, _r_ay );
		draw_vertex( _r_bx, _r_by );
		
		/*
		draw_vertex( _x-_width, _y+16 );
		draw_vertex( _x+_width, _y+16 );
		*/
	}
	
}

draw_vertex( x-_width, y+16 );
draw_vertex( x+_width, y+16 );

draw_primitive_end();
draw_set_colour( c_white );