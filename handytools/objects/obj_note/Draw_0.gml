mouse_active_force_colour( false );
screen_click_handle_fog();

matrix_chain_begin();
matrix_chain_rotate_y( tilt );
matrix_chain_scale( x_scale, y_scale, z_scale );
matrix_chain_rotate_z( image_angle );
matrix_chain_translate( x, y, z );
matrix_chain_end( matrix_world );
dotobj_submit( model );

mouse_active_reset_colour();