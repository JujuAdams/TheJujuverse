/// @description TRACKER list details string
/// @param list
/// @param divider

if ( !TRACKER_ON ) return "<tracker off>";

var _index   = argument0;
var _divider = (argument1!=undefined)?argument1:TRACE_DIV;

return concat( global.tracker_lists_origin[? _index ], _divider,
               global.tracker_lists_note[?   _index ], _divider,
               global.tracker_lists_protect[? _index ]? TRACKER_PROTECTED_LABEL : TRACKER_VOLATILE_LABEL, _divider,
               "size=", ds_list_size( _index ) );