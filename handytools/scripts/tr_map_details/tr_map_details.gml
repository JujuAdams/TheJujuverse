///@param index
///@param divider

if ( !TRACKER_ON ) return "<tracker off>";

var _index   = argument0;
var _divider = (argument1!=undefined)?argument1:TRACE_DIV;

return concat( global.tracker_maps_origin[?  _index ], _divider,
               global.tracker_maps_note[?    _index ], _divider,
               global.tracker_maps_protect[? _index ]?TRACKER_PROTECTED_LABEL:TRACKER_VOLATILE_LABEL, _divider,
               "size=", ds_map_size( _index ) );