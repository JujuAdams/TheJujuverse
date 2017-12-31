/// @description TRACKER surface creation
/// @param width
/// @param height
/// @param [note]
/// @param [protected]

var _index = surface_create( argument[0], argument[1] );

if ( TRACKER_ON ) {
    
    if ( global.tracker_surfaces_origin[? _index ] != undefined ) {
        if ( global.tracker_surfaces_protect[? _index ] ) {
            if ( TRACKER_ILLEGAL_THROW_ERROR ) {
                trace_error( false, "overwriting tracker entry for PROTECTED surface ", _index, ". lost during window resize?", NL, tr_surface_details( _index, NL ) );
            } else {
                trace_error_q( false, "overwriting tracker entry for PROTECTED surface ", _index, ". lost during window resize?", NL, tr_surface_details( _index, NL ) );
            }
        } else {
            trace_v( "overwriting tracker entry for surface ", _index, ". lost during window resize?" );
        }
    }
    
    __tr_surface_register( _index,   argument[0], argument[1],   (argument_count>2)? argument[2] : "",   (argument_count>3)? argument[3] : false );
    if ( TRACKER_DEBUG_SURFACE_CREATE ) trace_v( "creating surface=", _index, TRACE_DIV, tr_surface_details( _index, TRACE_DIV ) );
    
} else {
    
    __tr_surface_register( _index, argument[0], argument[1], DEFAULT, DEFAULT );
    
}

return _index;