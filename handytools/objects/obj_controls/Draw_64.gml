/*
var _scaling_x = 1;
var _scaling_y = 1;

if ( instance_exists( obj_render ) ) {
	var _scaling_x = obj_render.scaling_x;
	var _scaling_y = obj_render.scaling_y;
}

var _x = cam_world_x_to_window( control_property( 0, "mouse", "point x" ) );
var _y = cam_world_y_to_window( control_property( 0, "mouse", "point y" ) );
draw_sprite_ext( spr_cursor, control_property( 0, "state", "mouse" ) & HELD,
                 floor( _x ), floor( _y ),
				 _scaling_x, _scaling_y,
				 0, c_white, 1 );
*/