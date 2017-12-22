var _surface = grip_get_surface( "click" );
if ( surface_exists( _surface ) ) {
    var _pixel = surface_getpixel( _surface, global.app_surf_w*0.5, global.app_surf_h*0.5 );
    var _blue  = ( _pixel >> 16 ) & 255;
    var _green = ( _pixel >>  8 ) & 255;
    var _red   =   _pixel         & 255;
    var _index = _red + _green*256;
    global.click_instance_over = global.click_array[_index];
    global.click_through_mirror = ( _blue > 0 );
}

with( obj_camera ) {
	var _view_matrix = matrix_build_lookat( x, y, z,   look_x, look_y, look_z,   0, 0, 1 );
	var _proj_matrix = matrix_flip_y( matrix_build_projection_perspective_fov( DEFAULT_FOV, grip_get_aspect( "pov" ),
	                                                                           DEFAULT_Z_NEAR, DEFAULT_Z_FAR ) );
	grip_set_view_matrix( "pov"  , _view_matrix );
	grip_set_proj_matrix( "pov"  , _proj_matrix );
	grip_set_view_matrix( "click", _view_matrix );
	grip_set_proj_matrix( "click", _proj_matrix );
}

with( obj_mirror_frame ) {
	var _grip = concat( "mirror", mirror_index );
	var _view_matrix = matrix_build_lookat( x, y, z+32,   lengthdir_x( 1, image_angle )+x, lengthdir_y( 1, image_angle )+y, z+32,   0, 0, 1 );
	var _proj_matrix = matrix_flip_y( matrix_build_projection_perspective_fov( DEFAULT_FOV, grip_get_aspect( _grip ),
	                                                                           DEFAULT_Z_NEAR, DEFAULT_Z_FAR ) );
	grip_set_view_matrix( _grip, _view_matrix );
	grip_set_proj_matrix( _grip, _proj_matrix );
	
	var _grip = concat( "mirror click", mirror_click_index );
	grip_set_view_matrix( _grip, _view_matrix );
	grip_set_proj_matrix( _grip, _proj_matrix );
}

with( obj_dummy_mirror_frame ) {
	var _grip = concat( "mirror", mirror_index );
	var _view_matrix = matrix_build_lookat( x, y, z+32,   lengthdir_x( 1, image_angle )+x, lengthdir_y( 1, image_angle )+y, z+32,   0, 0, 1 );
	var _proj_matrix = matrix_flip_y( matrix_build_projection_perspective_fov( DEFAULT_FOV, grip_get_aspect( _grip ),
	                                                                           DEFAULT_Z_NEAR, DEFAULT_Z_FAR ) );
	grip_set_view_matrix( _grip, _view_matrix );
	grip_set_proj_matrix( _grip, _proj_matrix );
}