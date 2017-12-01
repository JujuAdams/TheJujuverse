/// @param player
/// @param strength
/// @param duration
/// @param repeats

with( obj_rumble ) {
    
    var _event_map = ds_map_create();
    ds_list_add( rumble_list, _event_map );
    ds_list_mark_as_map( rumble_list, ds_list_size( rumble_list )-1 );
    
    _event_map[? "player"    ] = argument0;
    _event_map[? "start"     ] = current_time;
    _event_map[? "duration"  ] = argument2;
    _event_map[? "frequency" ] = argument3;
    _event_map[? "decay"     ] = false;
    _event_map[? "left"      ] = argument1;
    _event_map[? "right"     ] = argument1;
    
}