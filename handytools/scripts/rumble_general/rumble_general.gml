/// @param player
/// @param left
/// @param right
/// @param start
/// @param duration
/// @param decay
/// @param repeats

//set frequency to <undefined> or 0 for no pulsing
with( obj_rumble ) {
    
    var _event_map = tr_map_create();
    tr_list_add_map( rumble_list, _event_map );
    
    _event_map[? "player"    ] = argument0;
    _event_map[? "start"     ] = argument3;
    _event_map[? "duration"  ] = argument4;
    _event_map[? "decay"     ] = argument5;
    _event_map[? "left"      ] = argument1;
    _event_map[? "right"     ] = argument2;
    _event_map[? "frequency" ] = argument6;
    
}