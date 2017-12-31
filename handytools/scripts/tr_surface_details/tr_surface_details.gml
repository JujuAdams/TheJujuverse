/// @description TRACKER surface details string
/// @param index
/// @param divider

var _index = argument0;
var _divider = (argument1!=undefined)? argument1 : TRACE_DIV;

var _width  = global.tracker_surfaces_width[?  _index ];
var _height = global.tracker_surfaces_height[? _index ];

if ( !TRACKER_ON ) return concat( global.tracker_surfaces_width[?  _index ], "x", global.tracker_surfaces_height[? _index ], _divider, _size, " bytes" );

return concat( global.tracker_surfaces_origin[?  _index ],  _divider,
               global.tracker_surfaces_note[?    _index ],  _divider,
               global.tracker_surfaces_protect[? _index ]? TRACKER_PROTECTED_LABEL : TRACKER_VOLATILE_LABEL, _divider,
               _width, "x", _height );