var _left   = VERY_LARGE;
var _top    = VERY_LARGE;
var _right  = VERY_NEGATIVE;
var _bottom = VERY_NEGATIVE;

var _any = false;
var _size = ds_list_size( camera_focus_list );
for( var _i = _size - 1; _i >= 0; _i-- ) {
	
	var _inst = camera_focus_list[|_i];
	if ( !instance_exists( _inst ) ) {
		
		ds_list_delete( camera_focus_list, _i );
		
	} else if ( _inst.camera_interesting ) {
		
		_any = true;
		_left   = min( _left,   _inst.x + _inst.camera_lead_x );
		_top    = min( _top,    _inst.y + _inst.camera_lead_y );
		_right  = max( _right,  _inst.x + _inst.camera_lead_x );
		_bottom = max( _bottom, _inst.y + _inst.camera_lead_y );
		
	}
	
}

if ( !_any ) return undefined;

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
camera_zoom = lerp( camera_zoom, _zoom, 0.5 );

_w = view_get_wport( view ) / camera_zoom;
_h = view_get_hport( view ) / camera_zoom;
_centre_x = clamp( _centre_x, 0.5*_w, room_width  - 0.5*_w );
_centre_y = clamp( _centre_y, 0.5*_h, room_height - 0.5*_h );

camera_focus_x = _centre_x;
camera_focus_y = _centre_y;

var _cam_left = lerp( camera_get_view_x( camera ), _centre_x - _w/2, 0.2 );
var _cam_top  = lerp( camera_get_view_y( camera ), _centre_y - _h/2, 0.2 );

camera_set_view_pos( camera, _cam_left, _cam_top );
camera_set_view_size( camera, _w, _h );