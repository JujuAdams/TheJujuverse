srf_pov = tr_surface_create( global.app_surf_w, global.app_surf_h );
camera_pov = camera_create_default_3d();
view_create_camera_surface( 0, camera_pov, srf_pov );

srf_click = tr_surface_create( global.app_surf_w, global.app_surf_h );
camera_click = camera_create_default_3d();
view_create_camera_surface( 1, camera_click, srf_click );

camera_2d = camera_create_default_2d();
/*
camera_2d = camera_create();
camera_set_view_mat( camera_2d, matrix_build_lookat( global.app_surf_w/2, global.app_surf_h/2, -16000, 
						           	                 global.app_surf_w/2, global.app_surf_h/2, 0,
							                         0, 1, 0 ) );
camera_set_proj_mat( camera_2d, matrix_build_projection_ortho( global.app_surf_w, global.app_surf_h, -16000, 16000 ) );
*/