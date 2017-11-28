///@param index
///@param note
///@param protect

if ( TRACKER_DEBUG_GRID_CREATE and TRACKER_BLANK_NOTE_THROW_ERROR and (argument1 == "") ) trace_error( false, "blank note!" );

ds_list_add( global.tracker_grids, argument0 );
global.tracker_grids_origin[?  argument0 ] = tracker_origin_string();
global.tracker_grids_note[?    argument0 ] = string_space_padded_right( QU + argument1 + QU, TRACKER_NOTE_SPACE_PADDING );;
global.tracker_grids_protect[? argument0 ] = argument2;