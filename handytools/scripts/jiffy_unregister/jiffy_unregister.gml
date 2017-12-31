/// @description Unregisters an instance from being updated by JIFFY
/// @param instance_or_object_index

var _index = global.jiffy_instances[| argument0 ];
if ( _index != -1 ){
    ds_list_delete( global.jiffy_instances, _index);
    return true;
}

return false;