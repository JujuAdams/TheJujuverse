var _left   = VERY_LARGE;
var _top    = VERY_LARGE;
var _right  = VERY_SMALL;
var _bottom = VERY_SMALL;

var _size = ds_list_size( camera_focus_list );
if ( _size <= 0 ) return undefined;

for( var _i = _size - 1; _i >= 0; _i-- ) {
	
	var _inst = camera_focus_list[|_i];
	if ( !instance_exists( _inst ) ) {
		
		ds_list_delete( camera_focus_list, _i );
		
	} else if ( _inst.camera_interesting ) {
		
		var _dcos =  dcos( -phy_rotation );
		var _dsin = -dsin( -phy_rotation );
		var _com_x = x + _inst.camera_i_com_x*_dcos - _inst.camera_i_com_y*_dsin;
		var _com_y = y + _inst.camera_i_com_x*_dsin + _inst.camera_i_com_y*_dcos;
		
		_left   = min( _left,   _com_x );
		_top    = min( _top,    _com_y );
		_right  = max( _right,  _com_x );
		_bottom = max( _bottom, _com_y );
		
	}
	
}

_left   -= 100;
_top    -= 100;
_right  += 100;
_bottom += 100;

_left   = clamp( _left  , 0, room_width  );
_top    = clamp( _top   , 0, room_height );
_right  = clamp( _right , 0, room_width  );
_bottom = clamp( _bottom, 0, room_height );

var _centre_x = 0.5 * ( _left + _right );
var _centre_y = 0.5 * ( _top + _bottom );
var _w = _right - _left;
var _h = _bottom - _top;

var _zoom = min( view_get_wport( view ) / _w, view_get_hport( view ) / _h );
var _zoom = clamp( camera_zoom, 0.5, 1 );

_w = view_get_wport( view ) / camera_zoom;
_h = view_get_hport( view ) / camera_zoom;
_centre_x = clamp( _centre_x, 0.5*_w, room_width  - 0.5*_w );
_centre_y = clamp( _centre_y, 0.5*_h, room_height - 0.5*_h );

return [ _centre_x, _centre_y, _zoom ];