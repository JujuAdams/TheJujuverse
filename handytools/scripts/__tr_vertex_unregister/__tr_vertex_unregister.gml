///@param index

ds_list_delete( global.tracker_vbuffs, ds_list_find_index( global.tracker_vbuffs, argument0 ) );
ds_map_delete( global.tracker_vbuffs_origin   , argument0 );
ds_map_delete( global.tracker_vbuffs_note     , argument0 );
ds_map_delete( global.tracker_vbuffs_protect  , argument0 );
ds_map_delete( global.tracker_vbuffs_callstack, argument0 );