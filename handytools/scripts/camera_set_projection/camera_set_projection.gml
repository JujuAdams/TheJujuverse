///camera_set_projection()

if ( obj_screen.do_3d ) {
    with( obj_camera ) {
		matrix_set( matrix_view, matrix_build_lookat( x, y, z,   look_x, look_y, look_z,   0, 0, 1 ) );
		matrix_set( matrix_projection, matrix_build_projection_perspective_fov( FOV, view_wview[0]/view_hview[0], 1, 4000 ) );
	}
} else {
    with( obj_camera ) {
	    var _w = APP_SURF_W * obj_debug.zoom_2d;
	    var _h = APP_SURF_H * obj_debug.zoom_2d;
		matrix_set( matrix_view, matrix_build_lookat( x, y, -16000, 
								                      x, y, 0,
								                      0, 1, 0 ) );
		matrix_set( matrix_projection, matrix_build_projection_ortho( _w, _h, 1, 16000 ) );
	
	    var _matrix = matrix_get( matrix_view );
	    _matrix[10] = -1;
	    matrix_set( matrix_view, _matrix );
	}
}