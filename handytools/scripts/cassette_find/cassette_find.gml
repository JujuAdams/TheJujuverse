/// @param grid_x
/// @param grid_y

var _grid_x = argument0;
var _grid_y = argument1;

with( obj_cassette ) {
    if ( grid_x == _grid_x ) && ( grid_y == _grid_y ) return id;
}

return undefined;