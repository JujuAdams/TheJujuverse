var _camera = camera_create();
camera_set_view_mat( _camera, matrix_build_lookat( 0, 0, 0,   1, 0, 0,   0, 0, 1 ) );
camera_set_proj_mat( _camera, matrix_build_projection_perspective_fov( FOV, DEFAULT_APP_SURF_W/DEFAULT_APP_SURF_H, 1, 4000 ) );
return _camera;