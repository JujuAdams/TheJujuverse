if ( global.screen_mirror_render ) exit; //Don't render mirror frames in mirrors

mouse_active_force_colour();
camera_click_handle_fog();
event_user( DRAW_USER_EVENT );
mouse_active_reset_colour();

if ( !global.screen_click_render ) {
    shader_reset();
    
    matrix_chain_begin();
    matrix_chain_rotate_z( image_angle );
    matrix_chain_translate( x + swell_x, y + swell_y, z );
    matrix_chain_end( matrix_world );
    vertex_submit( mirror_model, pr_trianglestrip, surface_get_texture( grip_get_surface( concat( "mirror", mirror_index ) ) ) );
    matrix_reset_world();
    
    shader_set( shd_per_texel_lighting );
}