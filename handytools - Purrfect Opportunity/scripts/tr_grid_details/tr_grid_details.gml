///@param index
///@param divider

if ( !TRACKER_ON ) return "<tracker off>";

var _index   = argument0;
var _divider = (argument1!=undefined)?argument1:TRACE_DEFAULT_DIVIDER;

return concat( global.tracker_grids_origin[? _index ], _divider,
		       global.tracker_grids_note[?   _index ], _divider,
			   global.tracker_grids_protect[? _index ]?TRACKER_PROTECTED_LABEL:TRACKER_VOLATILE_LABEL, _divider,
			   ds_grid_width( _index ), "x", ds_grid_height( _index ) );