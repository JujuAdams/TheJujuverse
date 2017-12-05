persistent = true;

smoothed_timer = 5000;
frame_start_time = get_timer();

do_lighting = true;
do_dither   = true;

global.dither_sprite = dither_make_sprite();
global.dither_texture = sprite_get_texture( global.dither_sprite, 0 );

srf_pov = tr_surface_create( APP_SURF_W, APP_SURF_H );
srf_click = noone;
click_array[0] = noone;
click_instance_over = noone;
click_through_mirror = false;
global.click_render = false;

global.render_mirror = false;




camera_pov = camera_create();
camera_set_view_mat( camera_pov, matrix_build_lookat( 0, 0, 0,   1, 0, 0,   0, 0, 1 ) );
camera_set_proj_mat( camera_pov, matrix_build_projection_perspective_fov( FOV, APP_SURF_W/APP_SURF_H, 1, 4000 ) );

camera_2d = camera_create();
camera_set_view_mat( camera_2d, matrix_build_lookat( APP_SURF_W/2, APP_SURF_H/2, -16000, 
						           	                 APP_SURF_W/2, APP_SURF_H/2, 0,
							                         0, 1, 0 ) );
camera_set_proj_mat( camera_2d, matrix_build_projection_ortho( APP_SURF_W, APP_SURF_H, -16000, 16000 ) );

view_enabled = true;
var _view = 0;
view_visible[_view]    = true;
view_camera[_view]     = camera_pov;
view_xport[_view]      = 0;
view_yport[_view]      = 0;
view_wport[_view]      = APP_SURF_W;
view_hport[_view]      = APP_SURF_H;
view_surface_id[_view] = srf_pov;