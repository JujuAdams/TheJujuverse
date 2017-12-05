srf_pov = tr_surface_create( APP_SURF_W, APP_SURF_H );

camera_pov = camera_create();
camera_set_view_mat( camera_pov, matrix_build_lookat( 0, 0, 0,   1, 0, 0,   0, 0, 1 ) );
camera_set_proj_mat( camera_pov, matrix_build_projection_perspective_fov( FOV, APP_SURF_W/APP_SURF_H, 1, 4000 ) );

view_enabled = true;
var _view = 0;
view_visible[_view]    = true;
view_camera[_view]     = camera_pov;
view_xport[_view]      = 0;
view_yport[_view]      = 0;
view_wport[_view]      = APP_SURF_W;
view_hport[_view]      = APP_SURF_H;
view_surface_id[_view] = srf_pov;