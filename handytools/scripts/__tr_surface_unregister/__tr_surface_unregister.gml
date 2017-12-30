///@param index

if ( TRACKER_ON ) {
    ds_map_delete(  global.tracker_surfaces_origin   , argument0 );
    ds_map_delete(  global.tracker_surfaces_note     , argument0 );
    ds_map_delete(  global.tracker_surfaces_protect  , argument0 );
    ds_map_delete(  global.tracker_surfaces_callstack, argument0 );
}

ds_list_delete( global.tracker_surfaces, ds_list_find_index( global.tracker_surfaces, argument0 ) );
ds_map_delete(  global.tracker_surfaces_width , argument0 );
ds_map_delete(  global.tracker_surfaces_height, argument0 );