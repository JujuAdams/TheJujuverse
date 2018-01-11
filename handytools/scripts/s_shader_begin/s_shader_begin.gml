/// @description Sets the current shader
/// @param shader

if ( argument0 == undefined ) || ( argument0 < 0 ) || ( !shader_is_compiled( argument0 ) ) {
	global.shader_focus = undefined;
	shader_reset();
} else {
	global.shader_focus = argument0;
	shader_set( argument0 );
}