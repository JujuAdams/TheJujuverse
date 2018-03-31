/// @param id

if ( argument0 == undefined ) exit;

with( argument0 ) {
    
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