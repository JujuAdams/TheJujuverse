/// @param grid_x
/// @param grid_y

var _target = global.cassette_grid[# argument0, argument1 ];

var _queue_x = ds_queue_create();
var _queue_y = ds_queue_create();
var _destroy_x = tr_list_create();
var _destroy_y = tr_list_create();
var _visited_grid = tr_grid_create( GRID_W, GRID_H );

ds_queue_enqueue( _queue_x, argument0 );
ds_queue_enqueue( _queue_y, argument1 );

while( !ds_queue_empty( _queue_x ) ) {
    
    var _x = ds_queue_dequeue( _queue_x );
    var _y = ds_queue_dequeue( _queue_y );
    
    if ( _visited_grid[# _x, _y ] ) continue;
    _visited_grid[# _x, _y ] = true;
    ds_list_add( _destroy_x, _x );
    ds_list_add( _destroy_y, _y );
    
    if ( _x > 0 ) && ( global.cassette_grid[# _x-1, _y ] == _target ) {
        ds_queue_enqueue( _queue_x, _x-1 );
        ds_queue_enqueue( _queue_y, _y   );
    }
    
    if ( _x < GRID_W-1 ) && ( global.cassette_grid[# _x+1, _y ] == _target ) {
        ds_queue_enqueue( _queue_x, _x+1 );
        ds_queue_enqueue( _queue_y, _y   );
    }
    
    if ( _y > 0 ) && ( global.cassette_grid[# _x, _y-1 ] == _target ) {
        ds_queue_enqueue( _queue_x, _x   );
        ds_queue_enqueue( _queue_y, _y-1 );
    }
    
    if ( _y < GRID_H-1 ) && ( global.cassette_grid[# _x, _y+1 ] == _target ) {
        ds_queue_enqueue( _queue_x, _x   );
        ds_queue_enqueue( _queue_y, _y+1 );
    }
    
}

var _size = ds_list_size( _destroy_x );

ds_queue_destroy( _queue_x );
ds_queue_destroy( _queue_y );
tr_list_destroy( _destroy_x );
tr_list_destroy( _destroy_y );
tr_grid_destroy( _visited_grid );

return _size;