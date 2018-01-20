///surface_blur( source surface, transfer surface, destination surface, shader )

var _source       = argument0;
var _transfer     = argument1;
var _destination  = argument2;
var _shader       = argument3;

var _width  = surface_get_width(  _source );
var _height = surface_get_height( _source );

surface_set_target( _transfer );
    shader_set( _shader );
    shader_set_uniform_f( shader_get_uniform( _shader, "u_fTexelStep" ), texture_get_texel_width( surface_get_texture( _source ) ), 0.0 );
        draw_surface( _source, 0, 0 );
    shader_reset();
surface_reset_target();

surface_set_target( _destination );
    shader_set( _shader );
    shader_set_uniform_f( shader_get_uniform( _shader, "u_fTexelStep" ), 0.0, texture_get_texel_height( surface_get_texture( _transfer ) ) );
        draw_surface( _transfer, 0, 0 );
    shader_reset();
surface_reset_target();