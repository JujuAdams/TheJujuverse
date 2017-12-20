var _camera = camera_create();
camera_set_view_mat( _camera, matrix_build_lookat( 0, 0, 0,   1, 0, 0,   0, 0, 1 ) );
camera_set_proj_mat( _camera, matrix_build_projection_perspective_fov( DEFAULT_FOV, global.app_surf_w/global.app_surf_h, 1, 4000 ) );
return _camera;