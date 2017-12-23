var _view_matrix = matrix_build_lookat( x, y, z,   look_x, look_y, look_z,   0, 0, 1 );
var _proj_matrix = matrix_flip_y( matrix_build_projection_perspective_fov( DEFAULT_FOV, grip_get_aspect( "3d" ),
	                                                                       DEFAULT_Z_NEAR, DEFAULT_Z_FAR ) );
grip_set_view_matrix( "3d"   , _view_matrix );
grip_set_proj_matrix( "3d"   , _proj_matrix );
grip_set_view_matrix( "click", _view_matrix );
grip_set_proj_matrix( "click", _proj_matrix );