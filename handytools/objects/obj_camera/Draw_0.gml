if ( global.game_got_hammer ) {
    matrix_chain_begin();
    matrix_chain_rotate_x( -85 );
    matrix_chain_rotate_z( -15 );
    matrix_chain_scale( 0.7, 0.7, 0.7 );
    matrix_chain_translate( 9, -8, -7 );
    matrix_chain_rotate_y( look_pz_angle );
    matrix_chain_rotate_z( look_xy_angle );
    matrix_chain_translate( x, y, z );
    matrix_chain_end( matrix_world );
    dotobj_submit( "hammer" );
}

if ( global.game_got_scissors ) {
    matrix_chain_begin();
    matrix_chain_rotate_x( -160 );
    matrix_chain_rotate_z( -20 );
    matrix_chain_scale( 0.7, 0.7, 0.7 );
    matrix_chain_translate( 10, -8, -5 );
    matrix_chain_rotate_y( look_pz_angle );
    matrix_chain_rotate_z( look_xy_angle );
    matrix_chain_translate( x, y, z );
    matrix_chain_end( matrix_world );
    dotobj_submit( "scissors" );
}