/// @param instance

var _inst = argument0;

with( obj_camera ) {
    if ( ds_list_find_index( camera_focus_list, _inst ) < 0 ) ds_list_add( camera_focus_list, _inst );
}