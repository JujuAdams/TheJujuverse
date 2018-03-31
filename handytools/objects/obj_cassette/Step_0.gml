event_inherited();
dotobj_animation_update_all();

//z-axis tweening
if ( mouse_over ) {
    if ( mouse_down ) {
        z_push_target = -4;
    } else {
        z_push_target =  4;
    }
} else {
    z_push_target = 0;
}
z_push = lerp( z_push, z_push_target, z_push_spring );

//z-axis drop in
z_drop_vel += Z_GRAVITY;
z_drop += z_drop_vel;
if ( z_drop <= 0 ) {
    z_drop = 0;
    z_drop_vel = -z_drop_bounce*z_drop_vel;
}

//check for matches
if ( check_wait ) && ( !any_cassettes_animating() ) {
    perform_match( grid_x, grid_y );
    check_wait = false;
}

//flip over
if ( move_do ) {
    
    move_t = parameterise( current_time, move_start, move_start+move_duration, true );
    if ( move_old_grid_y == grid_y ) && ( move_t > 0.5 ) {
        global.cassette_grid[# grid_x, grid_y ] = UD;
        grid_y++;
        global.cassette_grid[# grid_x, grid_y ] = cassette_index;
    }
    
    y = lerp( move_y_start, move_y_target, move_t );
    z = 10*( 1 - sqr( 2*move_t - 1 ) );
    move_flip = lerp( 0, 180, move_t );
    
    if ( move_t >= 1 ) {
        move_t = 0;
        move_do = false;
        flip += move_flip;
        move_flip = 0;
        z = 0;
        check_wait = true;
    }
}

//swap over
if ( swap_do ) {
    
    swap_t = parameterise( current_time, swap_start, swap_start+swap_duration, true );
    
    switch( swap_phase ) {
        case 0:
            z = lerp( 0, swap_z, swap_t );
        break;
        case 1:
            x = lerp( swap_x_start, swap_x_target, swap_t );
            y = lerp( swap_y_start, swap_y_target, swap_t );
        break;
        case 2:
            z = lerp( swap_z, 0, swap_t );
        break;
    }
    
    if ( swap_t >= 1 ) {
        swap_t = 0;
        swap_start = current_time;
        swap_phase++;
    }
    
    if ( swap_phase >= 3 ) {
        swap_do = false;
        global.cassette_grid[# grid_x, grid_y ] = cassette_index;
        //check_wait = true; //only check for matches on flips and the barline
    }
    
}

//check for space below
if ( !swap_do ) && ( !move_do ) && ( grid_y < GRID_H-1 ) && ( global.cassette_grid[# grid_x, grid_y+1 ] == UD ) {
    move_do = true;
    move_t = 0;
    move_start = current_time;
    move_rotation = 0;
    move_y_start = y;
    move_y_target = y + GRID_CELL_H;
    move_old_grid_y = grid_y;
}

//clicked
if ( mouse_clicked ) && ( !any_cassettes_animating() ) {
    
    if ( global.cassette_selected == undefined ) {
        
        global.cassette_selected = id;
        
    } else if ( global.cassette_selected == id ) {
        
        global.cassette_selected = undefined;
        
    } else {
        
        /*if ( abs( (global.cassette_selected).grid_x - grid_x ) == 1 )
        ^^ ( abs( (global.cassette_selected).grid_y - grid_y ) == 1 )*/ {
            
            trace_vf( global.cassette_selected, " <-> ", id );
            
            var _new_grid_x = (global.cassette_selected).grid_x;
            var _new_grid_y = (global.cassette_selected).grid_y;
            
            swap_do = true;
            swap_phase = 0;
            swap_start = current_time;
            swap_x_start = x;
            swap_y_start = y;
            swap_x_target = (global.cassette_selected).x;
            swap_y_target = (global.cassette_selected).y;
            swap_z = 12;
        
            with( global.cassette_selected ) {
                swap_do = true;
                swap_phase = 0;
                swap_start = current_time;
                swap_x_start = x;
                swap_y_start = y;
                swap_x_target = other.x;
                swap_y_target = other.y;
                grid_x = other.grid_x;
                grid_y = other.grid_y;
                swap_z = 15;
            }
            
            grid_x = _new_grid_x;
            grid_y = _new_grid_y;
        }
        
        global.cassette_selected = undefined;
        
    }
    
}