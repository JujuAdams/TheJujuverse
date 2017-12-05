if ( !global.click_render ) exit;

obj_screen.click_index += 5;
obj_screen.click_array[obj_screen.click_index] = id;
gpu_set_fog( true, make_colour_rgb( obj_screen.click_index mod 256, obj_screen.click_index div 256, 0 ), 0, 0 );