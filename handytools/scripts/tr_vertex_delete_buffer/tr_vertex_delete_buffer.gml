///@param index

var _index = argument0;

if ( TRACKER_ON ) {
    var _protect = global.tracker_vbuffs_protect[? _index ];
    
    if ( _protect == undefined ) {
        trace_v( "vertex buffer ", _index, " does not exist in tracker. May have been created by a JSON?" );
        vertex_delete_buffer( _index );
        return false;
    } else if ( _protect ) {
        if ( TRACKER_ILLEGAL_THROW_ERROR ) {
            trace_error( false, "attempting to destroy protected vertex buffer!", NL, tr_vertex_details( _index, NL ) );
        } else {
            trace_vf( "attempting to destroy protected vertex buffer!", NL, tr_vertex_details( _index, NL ) );
        }
        return false;
    }
    
    if ( TRACKER_DEBUG_VBUFF_DESTROY ) trace_v( "destroying vertex buffer ", _index, TRACE_DIV, tr_vertex_details( _index, TRACE_DIV ) );
    __tr_vertex_unregister( _index );
    
}

vertex_delete_buffer( _index );
return true;