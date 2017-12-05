srf_pov = tr_surface_create( APP_SURF_W, APP_SURF_H );
camera_pov = camera_create_default_3d();
view_create_camera_surface( 0, camera_pov, srf_pov );

srf_click = tr_surface_create( APP_SURF_W, APP_SURF_H );
camera_click = camera_create_default_3d();
view_create_camera_surface( 1, camera_click, srf_click );

/*
camera_2d = camera_create();
camera_set_view_mat( camera_2d, matrix_build_lookat( APP_SURF_W/2, APP_SURF_H/2, -16000, 
						           	                 APP_SURF_W/2, APP_SURF_H/2, 0,
							                         0, 1, 0 ) );
camera_set_proj_mat( camera_2d, matrix_build_projection_ortho( APP_SURF_W, APP_SURF_H, -16000, 16000 ) );
*/