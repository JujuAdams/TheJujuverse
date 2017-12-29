persistent = true;

global.app_surf_w         = DEFAULT_APP_SURF_W;
global.app_surf_h         = DEFAULT_APP_SURF_H;
global.screen_do_dither   = false && ALLOW_DITHER;
global.screen_do_lighting = true && ALLOW_LIGHTING;
global.screen_do_culling  = false;
global.screen_do_fxaa     = false;
global.screen_show_click  = false;

application_surface_draw_enable( false );
surface_resize( application_surface, global.app_surf_w, global.app_surf_h );
display_set_gui_size( DEFAULT_WINDOW_WIDTH, DEFAULT_WINDOW_HEIGHT );

global.mirror_count = 0;
global.mirror_click_count = 0;

global.screen_click_render = false;
global.screen_mirror_render = false;

if ( FPS_ON ) {
	smoothed_timer = 5000;
	frame_start_time = get_timer();
}

if ( ALLOW_DITHER ) {
	global.dither_sprite = dither_make_sprite();
	global.dither_texture = sprite_get_texture( global.dither_sprite, 0 );
}

if ( SCREEN_3D ) {
	global.click_array[ instance_count-1 ] = noone;
	global.click_array[ 0 ] = noone;
	global.click_index = 1;
	global.click_instance_over  = noone;
	global.click_through_mirror = false;
}

grip_create( "2d", global.app_surf_w, global.app_surf_h, false, false );
if ( SCREEN_3D ) {
	grip_create( "3d"   , global.app_surf_w, global.app_surf_h, false, true ); grip_activate( "3d", false ); //Use the 3D PoV grip as a view
	grip_create( "click", global.app_surf_w, global.app_surf_h, false, true ); grip_activate( "click", SCREEN_CLICK_GRIP_AS_VIEW );
} else {
	grip_activate( "2d", false ); //Use the 2D grip as a view
}
global.screen_click_render = false;

grip_create( "mirror click0", 960, 720, false, true );
grip_create( "mirror click1", 960, 720, false, true );
grip_create( "mirror0"      , 960, 720, false, true );
grip_create( "mirror1"      , 960, 720, false, true );
grip_create( "mirror2"      , 960, 720, false, true );
grip_create( "mirror3"      , 960, 720, false, true );
global.screen_mirror_render = false;