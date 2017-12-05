srf_pov = tr_surface_create( DEFAULT_APP_SURF_W, DEFAULT_APP_SURF_H );
camera_pov = camera_create_default_3d();
view_create_camera_surface( 0, camera_pov, srf_pov );

srf_click = tr_surface_create( DEFAULT_APP_SURF_W, DEFAULT_APP_SURF_H );
camera_click = camera_create_default_3d();
view_create_camera_surface( 1, camera_click, srf_click );

/*
camera_2d = camera_create();
camera_set_view_mat( camera_2d, matrix_build_lookat( DEFAULT_APP_SURF_W/2, DEFAULT_APP_SURF_H/2, -16000, 
						           	                 DEFAULT_APP_SURF_W/2, DEFAULT_APP_SURF_H/2, 0,
							                         0, 1, 0 ) );
camera_set_proj_mat( camera_2d, matrix_build_projection_ortho( DEFAULT_APP_SURF_W, DEFAULT_APP_SURF_H, -16000, 16000 ) );
*/