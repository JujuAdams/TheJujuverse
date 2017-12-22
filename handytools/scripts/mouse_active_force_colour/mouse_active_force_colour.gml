///mouse_active_force_colour()

if ( global.click_render ) exit;

if ( mouse_over )
&& ( mouse_interactible || editor_is_open() )
&& ( ( object_index != obj_door ) || !global.mirror_render )
&& ( ( object_index != obj_door ) || !obj_gameflow.transition_do ) {
    s_shader_colour( "u_vForceColour", c_white, lerp( 0.5, 0.8, mouse_glow ) );
}

if ( editor_is_open() && mouse_selected ) {
    s_shader_colour( "u_vForceColour", c_white, 0.7 );
}