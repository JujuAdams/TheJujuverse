/// @desc Sets shader uniforms for fogging.
/// @param enable
/// @param fog_colour
/// @param start
/// @param end

var _enable = argument0;
var _colour = argument1;
var _start  = argument2;
var _end    = argument3;

s_shader_rgb( "u_vFogColour", _colour );
s_shader_float( "u_vFogRange", _start, _end - _start, _enable );