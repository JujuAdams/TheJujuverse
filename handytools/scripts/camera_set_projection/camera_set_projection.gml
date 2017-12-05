///camera_set_projection()

with( obj_camera ) {
	matrix_set( matrix_view, matrix_build_lookat( x, y, z,   look_x, look_y, look_z,   0, 0, 1 ) );
	matrix_set( matrix_projection, matrix_build_projection_perspective_fov( FOV, APP_SURF_W/APP_SURF_H, 1, 4000 ) );
}