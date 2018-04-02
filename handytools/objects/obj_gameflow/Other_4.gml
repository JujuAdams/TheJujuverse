if ( room != rm_init ) {
    
    var _inst = tr_instance_create( GRID_CELL_W*(GRID_W-1)/2 - 25, 110, obj_camera );
    with( _inst ) {
        z = 160;
        look_xy_angle = 90;
        look_pz_angle = point_direction( -y, -z, -GRID_CELL_H*(GRID_H-1)/2, 0 );
        event_perform( ev_step, ev_step_normal );
    }
    
    var _inst = tr_instance_create_z( GRID_CELL_W*(GRID_W-1)/2, GRID_CELL_H*(GRID_H-1)/2, 100, 0, obj_light );
    _inst.range = 1000;
    _inst.colour = c_white
    
    tr_instance_create_z( 40, 90, 60, 0, obj_popcicle );
    /*
    var _inst = tr_instance_create_z( -50, 70, 0, 0, obj_boomy );
    
    ds_grid_clear( global.cassette_grid, UD );
    
    for( var _y = 0; _y < GRID_H; _y++ ) {
        for ( var _x = 0; _x < GRID_W; _x++ ) {
                
            repeat( 100 ) {
                global.cassette_grid[# _x, _y ] = irandom( CASSETTE_INDEX_MAX-1 );
                if ( check_for_match( _x, _y ) < 3 ) break;
            }
            
            cassette_spawn( _x, _y, global.cassette_grid[# _x, _y ] );
            
        }
    }
    
    var _inst = tr_instance_create_z( obj_camera.x, GRID_CELL_H*(GRID_H-0.5), 0, 0, obj_score );
    
    var _inst = tr_instance_create_z( 0, -30, 0, 0, obj_barline );
    _inst.grid_x = check_x;
    
    phon_play_loop( snd_loop );
    score = 0;
    */
}