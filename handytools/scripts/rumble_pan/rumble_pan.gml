/// @param player
/// @param left
/// @param right
/// @param duration

with( obj_rumble ) {
    
    var _event_map = ds_map_create();
    ds_list_add( rumble_list, _event_map );
    ds_list_mark_as_map( rumble_list, ds_list_size( rumble_list )-1 );
    
    _event_map[? "player"   ] = argument0;
    _event_map[? "start"    ] = current_time;
    _event_map[? "duration" ] = argument3;
    _event_map[? "decay"    ] = true;
    _event_map[? "left"     ] = argument1;
    _event_map[? "right"    ] = argument2;
    
}