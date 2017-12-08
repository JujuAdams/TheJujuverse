///@param index
///@param divider

if ( !TRACKER_ON ) return "<tracker off>";

var _index   = argument0;
var _divider = (argument1!=undefined)?argument1:TRACE_DIV;

return concat( global.tracker_vbuffs_origin[? _index ], _divider,
		       global.tracker_vbuffs_note[?   _index ], _divider,
			   global.tracker_vbuffs_protect[? _index ]?TRACKER_PROTECTED_LABEL:TRACKER_VOLATILE_LABEL, _divider,
			   "vertices=", vertex_get_number( _index ), _divider,
			   "size=", vertex_get_buffer_size( _index ) );