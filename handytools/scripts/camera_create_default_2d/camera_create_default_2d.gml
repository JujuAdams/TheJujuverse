var _camera = camera_create();
camera_set_view_mat( _camera, matrix_build_lookat( global.app_surf_w/2, global.app_surf_h/2, -16000, 
                                                      global.app_surf_w/2, global.app_surf_h/2, 0,
                                                   0, 1, 0 ) );
camera_set_proj_mat( _camera, matrix_build_projection_ortho( global.app_surf_w, global.app_surf_h, -16000, 16000 ) );
return _camera;