///@param surface

if ( ERROR_DEPRECIATED_SCRIPTS ) trace_error( false, "surface_wipe() is a depreciated script." );

surface_set_target( argument0 );
draw_clear_alpha( c_black, 0 );
surface_reset_target();