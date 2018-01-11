/// @description Sets a matrix array uniform in the current shader
/// @param uniform
/// @param matrix

if ( global.shader_focus == undefined ) exit;

shader_set_uniform_matrix_array( shader_get_uniform( global.shader_focus, argument0 ), argument1 );