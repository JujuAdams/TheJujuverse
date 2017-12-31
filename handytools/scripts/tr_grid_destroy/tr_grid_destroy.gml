/// @description TRACKER grid destruction
/// @param index

var _index = argument0;

if ( TRACKER_ON ) {
    var _protect = global.tracker_grids_protect[? _index ];
    if ( _protect == undefined ) {
        trace_v( "grid ", _index, " does not exist in tracker. May have been created by a JSON?" );
        ds_grid_destroy( _index );
        return false;
    } else if ( _protect ) {
        if ( TRACKER_ILLEGAL_THROW_ERROR ) {
            trace_error( false, "attempting to destroy protected grid!", NL, tr_grid_details( _index, NL ) );
        } else {
            trace_error_q( false, "atempting to destroy protected grid!", NL, tr_grid_details( _index, NL ) );
        }
        return false;
    }
    
    if ( TRACKER_DEBUG_GRID_DESTROY ) trace_v( "destroying grid ", _index, TRACE_DIV, tr_grid_details( _index, TRACE_DIV ) );
    __tr_grid_unregister( _index );
    
}

ds_grid_destroy( _index );
return true;