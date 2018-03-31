/// @param grid_x
/// @param grid_y
/// @param index

var _grid_x = argument0;
var _grid_y = argument1;
var _index  = argument2;

if ( _index == undefined ) _index = irandom( CASSETTE_INDEX_MAX-1 );
global.cassette_grid[# _grid_x, _grid_y ] = _index;

var _x = _grid_x*GRID_CELL_W;
var _y = _grid_y*GRID_CELL_H - 10;
with( tr_instance_create_z( _x, _y, 0, 0, obj_cassette ) ) {
    
    grid_x = _grid_x;
    grid_y = _grid_y;
    cassette_index = _index;
    dotobj_animation_create( "static", concat( "cassette ", cassette_index ), 0 );
    dotobj_animation_play( "main", "static" );
    
    return id;
    
}

return undefined;