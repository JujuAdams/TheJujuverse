/// @description TRACKER internal function to add a surface to global record
/// @param index
/// @param width
/// @param height
/// @param note
/// @param protect

if ( TRACKER_DEBUG_SURFACE_CREATE && TRACKER_BLANK_NOTE_THROW_ERROR && (argument3 == "") ) trace_error( false, "blank note!" );

ds_list_add( global.tracker_surfaces, argument0 );
global.tracker_surfaces_width[?  argument0 ] = (argument1!=undefined)? argument1 : surface_get_width(  argument0 );
global.tracker_surfaces_height[? argument0 ] = (argument2!=undefined)? argument2 : surface_get_height( argument0 );

if ( TRACKER_ON ) {
    global.tracker_surfaces_origin[?    argument0 ] = tracker_origin_string();
    global.tracker_surfaces_note[?      argument0 ] = string_space_padded_right( QU + argument3 + QU, TRACKER_NOTE_SPACE_PADDING );
    global.tracker_surfaces_protect[?   argument0 ] = argument4;
    global.tracker_surfaces_callstack[? argument0 ] = debug_get_callstack();
}