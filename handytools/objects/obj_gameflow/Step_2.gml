if ( room != rm_init ) {
    
    if ( mouse_check_button_pressed( mb_left ) ) refresh_wait_time = current_time;
    if ( any_cassettes_animating() ) refresh_wait_time = current_time;
    
    if ( time_has_passed( refresh_wait_time, 200 ) ) {
        
        for( var _y = 0; _y < GRID_H; _y++ ) {
            for ( var _x = 0; _x < GRID_W; _x++ ) {
                if ( global.cassette_grid[# _x, _y ] == UD ) {
                    
                    repeat( 100 ) {
                        global.cassette_grid[# _x, _y ] = irandom( CASSETTE_INDEX_MAX-1 );
                        if ( check_for_match( _x, _y ) < 3 ) break;
                    }
                    
                    cassette_spawn( _x, _y, global.cassette_grid[# _x, _y ] );
                    
                }
            }
        }
    
    }
    
}