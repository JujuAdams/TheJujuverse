///@param index
///@param note
///@param protect

if ( TRACKER_DEVELOPMENT_MAP_CREATE and TRACKER_BLANK_NOTE_THROW_ERROR and (argument1 == "") ) trace_error( false, "blank note!" );

ds_list_add( global.tracker_maps, argument0 );
global.tracker_maps_origin[?  argument0 ] = tracker_origin_string();
global.tracker_maps_note[?    argument0 ] = string_space_padded_right( QU + argument1 + QU, TRACKER_NOTE_SPACE_PADDING );;
global.tracker_maps_protect[? argument0 ] = argument2;