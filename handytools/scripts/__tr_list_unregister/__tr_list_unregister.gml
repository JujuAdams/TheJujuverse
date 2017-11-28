///@param index

ds_list_delete( global.tracker_lists, ds_list_find_index( global.tracker_lists, argument0 ) );
ds_map_delete( global.tracker_lists_origin , argument0 );
ds_map_delete( global.tracker_lists_note   , argument0 );
ds_map_delete( global.tracker_lists_protect, argument0 );