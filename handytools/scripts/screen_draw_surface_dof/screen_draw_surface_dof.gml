/// @param surface
/// @param x
/// @param y
/// @param width
/// @param height
/// @param depth_surface
/// @param blur_surface
/// @param DOF_centre
/// @param DOF_range

var _surface       = argument0;
var _x             = argument1;
var _y             = argument2;
var _width         = argument3;
var _height        = argument4;
var _depth_surface = argument5;
var _blur_surface  = argument6;
var _dof_centre    = argument7;
var _dof_range     = argument8;

s_shader_begin( shd_dof );
s_shader_surface_sampler( "u_sDepth", _depth_surface );
s_shader_surface_sampler( "u_sBlur", _blur_surface );
s_shader_float( "u_vDOF_centre", _dof_centre );
s_shader_float( "u_vDOF_range", _dof_range );
draw_surface_stretched( _surface, _x, _y, _width, _height );
s_shader_end();