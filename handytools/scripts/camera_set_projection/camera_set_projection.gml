///camera_set_projection()

with( obj_camera ) {
	matrix_set( matrix_view, matrix_build_lookat( x, y, z,   look_x, look_y, look_z,   0, 0, 1 ) );
	matrix_set( matrix_projection, matrix_build_projection_perspective_fov( DEFAULT_FOV, global.app_surf_w/global.app_surf_h, 1, 4000 ) );
}