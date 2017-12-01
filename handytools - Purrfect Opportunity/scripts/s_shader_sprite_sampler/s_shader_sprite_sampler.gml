///@param uniform
///@param sprite
///@param image

texture_set_stage( shader_get_sampler_index( global.shader_focus, argument0 ), sprite_get_texture( argument1, argument2 ) );