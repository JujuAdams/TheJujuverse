mouse_active_force_colour();
screen_click_handle_fog();

matrix_chain_begin();
matrix_chain_rotate_y( body_angle );
matrix_chain_rotate_x( 20 );
matrix_chain_scale( x_scale, y_scale, z_scale );
matrix_chain_translate( x, y, z );
matrix_chain_end( matrix_world );
dotobj_submit( "boomy" );

matrix_chain_begin();
matrix_chain_rotate_x( head_tilt );
matrix_chain_rotate_y( head_angle );
matrix_chain_translate( 0, -26, 3 );
matrix_chain_rotate_x( 20 );
matrix_chain_scale( x_scale, y_scale, z_scale );
matrix_chain_translate( x, y, z );
matrix_chain_end( matrix_world );
dotobj_submit( model );

mouse_active_reset_colour();