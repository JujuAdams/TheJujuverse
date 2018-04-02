mouse_active_force_colour( false );
screen_click_handle_fog();

matrix_chain_begin();
matrix_chain_translate( x, y, z );
matrix_chain_end( matrix_world );
dotobj_submit( "popcicle.Box_6"  );
dotobj_submit( "popcicle.Box_8"  );
dotobj_submit( "popcicle.Box_9"  );
dotobj_submit( "popcicle.Box_10" );
dotobj_submit( "popcicle.Box_11" );
dotobj_submit( "popcicle.Box_12" );
dotobj_submit( "popcicle.Box_13" );
dotobj_submit( "popcicle.Box_14" );
dotobj_submit( "popcicle.Box_15" );

mouse_active_reset_colour();