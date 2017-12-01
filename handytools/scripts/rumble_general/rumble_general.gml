/// @param player
/// @param left
/// @param right
/// @param start
/// @param duration
/// @param decay
/// @param repeats

//set frequency to <undefined> or 0 for no pulsing
with( obj_rumble ) {
    
    var _event_map = ds_map_create();
    ds_list_add( rumble_list, _event_map );
    ds_list_mark_as_map( rumble_list, ds_list_size( rumble_list )-1 );
    
    _event_map[? "player"    ] = argument0;
    _event_map[? "start"     ] = argument3;
    _event_map[? "duration"  ] = argument4;
    _event_map[? "decay"     ] = argument5;
    _event_map[? "left"      ] = argument1;
    _event_map[? "right"     ] = argument2;
    _event_map[? "frequency" ] = argument6;
    
}