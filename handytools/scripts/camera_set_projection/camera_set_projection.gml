///camera_set_projection()

with( obj_camera ) {
	matrix_set( matrix_view, matrix_build_lookat( x, y, z,   look_x, look_y, look_z,   0, 0, 1 ) );
	matrix_set( matrix_projection, matrix_build_projection_perspective_fov( FOV, view_wview[0]/view_hview[0], 1, 4000 ) );
}