/// @description TRACKER internal function to add an instance to global record
/// @param index

ds_list_delete( global.tracker_instances, ds_list_find_index( global.tracker_instances, argument0 ) );
ds_map_delete( global.tracker_instances_origin   , argument0 );
ds_map_delete( global.tracker_instances_note     , argument0 );
ds_map_delete( global.tracker_instances_protect  , argument0 );
ds_map_delete( global.tracker_instances_callstack, argument0 );