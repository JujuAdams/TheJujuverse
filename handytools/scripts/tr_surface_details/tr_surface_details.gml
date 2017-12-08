///@param index
///@param divider

var _index = argument0;
var _divider = (argument1!=undefined)?argument1:TRACE_DIV;

var _size = global.tracker_surfaces_width[? _index ]*global.tracker_surfaces_height[? _index ]*4;
if ( !TRACKER_ON ) return concat( global.tracker_surfaces_width[?  _index ], "x", global.tracker_surfaces_height[? _index ], _divider, _size, " bytes" );

return concat( global.tracker_surfaces_origin[?  _index ],  _divider,
		       global.tracker_surfaces_note[?    _index ],  _divider,
			   global.tracker_surfaces_protect[? _index ]?TRACKER_PROTECTED_LABEL:TRACKER_VOLATILE_LABEL, _divider,
		       global.tracker_surfaces_width[?   _index ], "x", global.tracker_surfaces_height[? _index ], _divider,
			   _size, " bytes" );