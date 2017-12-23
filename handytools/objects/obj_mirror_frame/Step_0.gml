event_inherited();

if ( instance_exists( obj_floor ) ) {
	var _dir = point_direction( x, y, mean( obj_floor.x1, obj_floor.x2 ), mean( obj_floor.y1, obj_floor.y2 ) );
	_dir = round( _dir/90 )*90;
	swell_x = lengthdir_x( global.game_swell, _dir );
	swell_y = lengthdir_y( global.game_swell, _dir );
}

var _grip = concat( "mirror", mirror_index );
var _view_matrix = matrix_build_lookat( x, y, z+32,   lengthdir_x( 1, image_angle )+x, lengthdir_y( 1, image_angle )+y, z+32,   0, 0, 1 );
var _proj_matrix = matrix_flip_y( matrix_build_projection_perspective_fov( DEFAULT_FOV, grip_get_aspect( _grip ),
	                                                                        DEFAULT_Z_NEAR, DEFAULT_Z_FAR ) );
grip_set_view_matrix( _grip, _view_matrix );
grip_set_proj_matrix( _grip, _proj_matrix );
	
var _grip = concat( "mirror click", mirror_click_index );
grip_set_view_matrix( _grip, _view_matrix );
grip_set_proj_matrix( _grip, _proj_matrix );