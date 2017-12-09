if ( global.game_editing ) {
    
    if ( ( current_time mod 500 ) < 450 ) {
        
        mouse_active_force_colour();
		camera_click_handle_fog();
        event_user( 0 );
        mouse_active_reset_colour();
        
    }
    
}