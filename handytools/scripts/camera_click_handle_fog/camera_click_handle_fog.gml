if ( !global.click_render ) exit;
gpu_set_fog( true, make_colour_rgb( my_click_index mod 256, my_click_index div 256, global.mirror_render? 128 : 0 ), 0, 0 );