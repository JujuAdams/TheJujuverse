event_inherited();
dotobj_animation_update_all();

//z-axis tweening
if ( mouse_over ) {
    if ( mouse_down ) {
        z_push_target = -10;
    } else {
        z_push_target =  10;
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

//flip over
if ( move_do ) {
    
    mouse_over = false;
    mouse_down = false;
    mouse_clicked = false;
    
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
    }
}

//clicked
if ( !move_do ) && ( grid_y < GRID_H-1 ) && ( global.cassette_grid[# grid_x, grid_y+1 ] == UD ) {
    move_do = true;
    move_t = 0;
    move_start = current_time;
    move_rotation = 0;
    move_y_start = y;
    move_y_target = y + GRID_CELL_H;
    move_old_grid_y = grid_y;
}

if ( mouse_clicked ) {
    
    tr_instance_destroy();
    global.cassette_grid[# grid_x, grid_y ] = UD;
    
    tr_instance_create_z( x, y, z+4, random( 360 ), obj_poof );
    var _inst = tr_instance_create_z( x, y, z+6, 90*irandom(3), obj_poof );
    with( _inst ) {
        var _scale = random_range( 0.4, 0.6 );
        x_scale = _scale;
        y_scale = _scale;
        z_scale = _scale;
    }
    /*
    var _inst = tr_instance_create_z( x, y, z, 0, obj_note );
    var _index = cassette_index;
    //if ( _index == 0 ) _index = choose( 3, 4, 5 );
    switch( _index ) {
        case 0:
        case 1:
        case 2: _inst.model = choose( "note black 0" , "note black 1" , "note black 2"  ); break;
        case 3: _inst.model = choose( "note yellow 0", "note yellow 1", "note yellow 2" ); break;
        case 4: _inst.model = choose( "note red 0"   , "note red 1"   , "note red 2"    ); break;
        case 5: _inst.model = choose( "note blue 0"  , "note blue 1"  , "note blue 2"   ); break;
    }
    */
}