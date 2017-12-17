///@function surface_check( surface, width, height, wipe )

if ( ERROR_DEPRECIATED_SCRIPTS ) trace_error( false, "surface_check() is a depreciated script. use tr_surface_check() instead" );

var _surface = argument0;
var _width   = argument1;
var _height  = argument2;
var _wipe    = argument3;

if ( _width == undefined ) || ( _height == undefined ) {
	_width = surface_get_width( application_surface );
	_height = surface_get_height( application_surface );
}

if ( !surface_exists( _surface ) ) {
	
	var _surface = tr_surface_create( _width, _height );
	if ( _wipe ) surface_wipe( _surface );
	
} else if ( surface_get_width( _surface ) != _width ) || ( surface_get_height( _surface ) != _height ) {
	
	var _surface = tr_surface_create( _width, _height );
	if ( _wipe ) surface_wipe( _surface );
	
}

return _surface;