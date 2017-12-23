///@param index

ds_list_delete( global.tracker_grids, ds_list_find_index( global.tracker_grids, argument0 ) );
ds_map_delete( global.tracker_grids_origin   , argument0 );
ds_map_delete( global.tracker_grids_note     , argument0 );
ds_map_delete( global.tracker_grids_protect  , argument0 );
ds_map_delete( global.tracker_grids_callstack, argument0 );