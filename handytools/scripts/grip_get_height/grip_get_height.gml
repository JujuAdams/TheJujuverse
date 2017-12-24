///@param index

if ( !GRIP_ON ) return surface_get_height( application_surface );

var _map = global.grip_cameras_map[? argument0 ];
return _map[? "height" ] * ( _map[? "relative size" ]? surface_get_height( APP_SURF ) : 1 );