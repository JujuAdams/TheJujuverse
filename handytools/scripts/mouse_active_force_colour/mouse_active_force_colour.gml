///mouse_active_force_colour()

if ( global.screen_click_render ) exit;

if ( mouse_over && mouse_interactible ) {
    s_shader_rgba( "u_vForceColour", c_white, lerp( 0.0, 0.8, mouse_glow ) );
}