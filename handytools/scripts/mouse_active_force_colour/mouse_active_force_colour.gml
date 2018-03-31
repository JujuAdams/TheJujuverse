/// @param force_mouse_over

if ( global.screen_click_render ) exit;

if ( ( mouse_over || argument0 ) && mouse_interactible ) {
    mouse_glow = 0.5 + 0.5*dsin( ( current_time - mouse_glow_start )/2 );
    s_shader_rgba( "u_vForceColour", c_white, lerp( 0.4, 0.8, mouse_glow ) );
}