var _camera = camera_create();
camera_set_view_mat( _camera, matrix_build_lookat( DEFAULT_APP_SURF_W/2, DEFAULT_APP_SURF_H/2, -16000, 
						           	               DEFAULT_APP_SURF_W/2, DEFAULT_APP_SURF_H/2, 0,
							                       0, 1, 0 ) );
camera_set_proj_mat( _camera, matrix_build_projection_ortho( DEFAULT_APP_SURF_W, DEFAULT_APP_SURF_H, -16000, 16000 ) );
return _camera;