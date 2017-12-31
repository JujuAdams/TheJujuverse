/// @description TRACKER grid creation
/// @param width
/// @param height
/// @param [note]
/// @param [protected]

if ( TRACKER_ON ) {
    var _index = ds_grid_create( argument[0], argument[1] );
    
    if ( global.tracker_grids_origin[? _index ] != undefined ) {
        if ( global.tracker_grids_protect[? _index ] ) {
            if ( TRACKER_ILLEGAL_THROW_ERROR ) {
                trace_error( false, "overwriting tracker entry for PROTECTED grid=", _index, ". accidental deletion through JSON?", NL, tr_grid_details( _index, NL ) );
            } else {
                trace_error_q( false, "overwriting tracker entry for PROTECTED grid=", _index, ". accidental deletion through JSON?", NL, tr_grid_details( _index, NL ) );
            }
        } else {
            trace_v( "overwriting tracker entry for grid=", _index, ". accidental deletion through JSON?" );
        }
    }
    
    __tr_grid_register( _index,   (argument_count>2)? argument[2] : "",   (argument_count>3)? argument[3] : false );
    if ( TRACKER_DEBUG_GRID_CREATE ) trace_v( "creating grid=", _index, TRACE_DIV, tr_grid_details( _index, TRACE_DIV ) );
    return _index;
}

return ds_grid_create( argument[0], argument[1] );