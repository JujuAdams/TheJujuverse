persistent = true;

application_surface_draw_enable( false );
surface_resize( application_surface, global.app_surf_w, global.app_surf_h );
display_set_gui_size( DEFAULT_WINDOW_WIDTH, DEFAULT_WINDOW_HEIGHT );

smoothed_timer = 5000;
frame_start_time = get_timer();

global.dither_sprite = dither_make_sprite();
global.dither_texture = sprite_get_texture( global.dither_sprite, 0 );

srf_pov = noone;
srf_click = noone;
click_array[0] = noone;
click_instance_over = noone;
click_through_mirror = false;
global.click_render = false;

global.mirror_render = false;