///mouse_active_force_colour()

if ( global.click_render ) exit;

if ( mouse_over )
&& ( mouse_interactible || editor_is_open() )
&& ( ( object_index != obj_door ) || !global.mirror_render )
&& ( ( object_index != obj_door ) || !obj_gameflow.transition_do ) {
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_vForceColour" ), 1.0, 1.0, 1.0, lerp( 0.5, 0.8, mouse_glow ) );
}

if ( editor_is_open() && mouse_selected ) {
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_vForceColour" ), 1.0, 1.0, 1.0, 0.7 );
}