/// @description TRACKER surface freeing
/// @param index

var _index = argument0;

if ( TRACKER_ON ) {
    var _protect = global.tracker_surfaces_protect[? _index ];
    if ( _protect == undefined ) {
        trace_v( "surface ", _index, " does not exist in tracker (surface_free)" );
        surface_free( _index );
        return false;
    } else if ( _protect ) {
        if ( TRACKER_ILLEGAL_THROW_ERROR ) {
            trace_error( false, "attempting to destroy protected surface!", NL, tr_surface_details( _index, NL ) );
        } else {
            trace_error_q( false, "atempting to destroy protected surface!", NL, tr_surface_details( _index, NL ) );
        }
        return false;
    }
    
    if ( TRACKER_DEBUG_SURFACE_DESTROY ) trace_v( "destroying surface ", _index, TRACE_DIV, tr_surface_details( _index, DEFAULT ) );
    
}

__tr_surface_unregister( _index );
surface_free( _index );
return true;