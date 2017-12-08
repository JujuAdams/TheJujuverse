///@param index
///@param divider

if ( !TRACKER_ON ) return "<tracker off>";

var _index   = argument0;
var _divider = (argument1!=undefined)?argument1:TRACE_DIV;

return concat( global.tracker_instances_origin[? _index ], _divider,
		       global.tracker_instances_note[?   _index ], _divider,
			   global.tracker_instances_protect[? _index ]?TRACKER_PROTECTED_LABEL:TRACKER_VOLATILE_LABEL );