///@param index

var _index  = argument0;
if ( _index == undefined ) or ( _index < 0 ) return undefined;

var _width  = global.tracker_surfaces_width[?  _index ];

if ( _width == undefined ) {
	
	if ( surface_exists( _index ) ) {
		__tr_surface_register( _index, surface_get_width( _index ), surface_get_height( _index ), "autoregistered (surface_check_auto)", false );
		if ( TRACKER_DEBUG_SURFACE_CHECK ) trace_v( "existing surface ", _index, " newly registered in tracker (surface_check_auto)", TRACE_DIV, tr_surface_details( _index, DEFAULT ) );
		return _index;
	}
	
	trace_error( false, "surface ", _index, " does not exist in tracker, nor in VRAM", NL, "use tr_surface_check() for JIT surface creation" );
	return undefined;
	
}

var _height = global.tracker_surfaces_height[? _index ];

var _regen = false;
if ( !surface_exists( _index ) ) {
	_regen = true;
} else if ( surface_get_width( _index ) != _width ) or ( surface_get_height( _index ) != _height ) {
	_regen = true;
}

if ( _regen ) {
	
	if ( TRACKER_ON and TRACKER_DEBUG_SURFACE_CHECK ) trace_v( "regen surface=", _index, TRACE_DIV, tr_surface_details( _index, DEFAULT ) );
	
	var _note    = global.tracker_surfaces_note[? _index ];
	var _protect = global.tracker_surfaces_protect[? _index ];
	__tr_surface_unregister( _index );
	surface_free( _index );
	return tr_surface_create( _width, _height, _note, _protect );
	
}

return _index;