///@param index
///@param width
///@param height
///@param [note]

var _index  = argument[0];
var _width  = (argument[1]!=undefined and argument[1]!=application_surface)? argument[1] : surface_get_width(  application_surface );
var _height = (argument[2]!=undefined and argument[2]!=application_surface)? argument[2] : surface_get_height( application_surface );
var _note   = (argument_count>3)? argument[3] : "";

if ( global.tracker_surfaces_width[? _index ] == undefined ) {
	
	if ( surface_exists( _index ) ) {
		__tr_surface_register( _index, surface_get_width( _index ), surface_get_height( _index ), _note, false );
		if ( TRACKER_DEVELOPMENT_SURFACE_CHECK ) trace_v( "existing surface ", _index, " newly registered in tracker (surface_check)", TRACE_DEFAULT_DIVIDER, tr_surface_details( _index, DEFAULT ) );
		return _index;
	}
	
	if ( TRACKER_DEVELOPMENT_SURFACE_CHECK ) trace_v( "surface ", _index, " does not exist in tracker, nor in VRAM. creating new surface" );
	return tr_surface_create( _width, _height, _note, false );
	
}

var _regen = false;
if ( !surface_exists( _index ) ) {
	_regen = true;
} else if ( surface_get_width( _index ) != _width ) or ( surface_get_height( _index ) != _height ) {
	_regen = true;
}

if ( _regen ) {
	
	if ( TRACKER_DEVELOPMENT_SURFACE_CHECK ) trace_v( "regen surface ", _index, TRACE_DEFAULT_DIVIDER, tr_surface_details( _index, DEFAULT ) );
	
	var _note    = DEFAULT;
	var _protect = DEFAULT;
	if ( TRACKER_ON ) {
		_note    = global.tracker_surfaces_note[?    _index ];
		_protect = global.tracker_surfaces_protect[? _index ];
	}
	
	__tr_surface_unregister( _index );
	surface_free( _index );
	return tr_surface_create( _width, _height, _note, _protect );
	
}

return _index;