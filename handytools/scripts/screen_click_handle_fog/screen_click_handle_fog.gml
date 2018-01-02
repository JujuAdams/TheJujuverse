/// @param blue

var _blue = ((argument_count<1) || (argument[0]==undefined))? 0 : argument[0];

if ( !global.screen_click_render ) exit;
gpu_set_fog( true, make_colour_rgb( my_click_index mod 256, my_click_index div 256, _blue ), 0, 0 );