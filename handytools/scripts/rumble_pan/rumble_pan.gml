/// @description Adds a rumble operation to the stack, biased to one side
/// @param player
/// @param left
/// @param right
/// @param duration

with( obj_rumble ) {
    
    var _event_map = tr_map_create();
    tr_list_add_map( rumble_list, _event_map );
    
    _event_map[? "player"   ] = argument0;
    _event_map[? "start"    ] = current_time;
    _event_map[? "duration" ] = argument3;
    _event_map[? "decay"    ] = true;
    _event_map[? "left"     ] = argument1;
    _event_map[? "right"    ] = argument2;
    
}