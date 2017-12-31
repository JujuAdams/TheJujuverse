/// @description TRACKER internal function to remove a list from global record
/// @param index

ds_list_delete( global.tracker_maps, ds_list_find_index( global.tracker_maps, argument0 ) );
ds_map_delete( global.tracker_maps_origin   , argument0 );
ds_map_delete( global.tracker_maps_note     , argument0 );
ds_map_delete( global.tracker_maps_protect  , argument0 );
ds_map_delete( global.tracker_maps_callstack, argument0 );