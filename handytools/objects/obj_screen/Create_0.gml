///Create

persistent = true;

smoothed_timer = 5000;
frame_start_time = get_timer();

do_lighting = true;
do_dither   = true;
do_3d       = true;

global.dither_sprite = dither_make_sprite();
global.dither_texture = sprite_get_texture( global.dither_sprite, 0 );

srf_click = noone;
click_array[0] = noone;
click_instance_over = noone;
click_through_mirror = false;
global.click_render = false;

global.render_mirror = false;