///mouse_active_force_colour()

if ( global.click_render ) exit;

if ( mouse_over )
and ( mouse_interactible or global.game_editing )
and ( ( object_index != obj_door ) or !global.mirror_render )
and ( ( object_index != obj_door ) or !obj_game.transition_do ) {
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_vForceColour" ), 1.0, 1.0, 1.0, lerp( 0.5, 0.8, mouse_glow ) );
}

if ( global.game_editing ) and ( mouse_selected ) {
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_vForceColour" ), 1.0, 1.0, 1.0, 0.7 );
}