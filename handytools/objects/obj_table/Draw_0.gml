/*
mouse_active_force_colour();

if ( outro_t < 1 ) {
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fVibrate" ), lerp( 0, 9, outro_t ) );
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fGarbage" ), random( 1 ) );
}

d3d_transform_set_rotation_x( -90 );
d3d_transform_add_rotation_z( image_angle );
if ( global.game_room == 6 ) d3d_transform_add_scaling( 1, 1, -1 );
d3d_transform_add_translation( x, y, z );
if ( global.game_room != 6 ) d3d_transform_add_translation( 0, 0,  global.game_swell );
if ( global.game_room == 6 ) d3d_transform_add_translation( 0, 0, -global.game_swell );
vertex_submit( global.vbf_table, pr_trianglelist, sprite_get_texture( spr_tex_table, 0 ) );
d3d_transform_set_identity();

mouse_active_reset_colour();

if ( outro_t < 1 ) {
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fVibrate" ), 0.0 );
    shader_set_uniform_f( shader_get_uniform( shd_psx, "u_fGarbage" ), 0.0 );
}
*/