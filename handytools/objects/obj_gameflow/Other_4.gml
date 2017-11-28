if ( room != rm_game ) global.gameflow_state = e_game_state.menu;
if ( room == rm_options ) global.controls_focus = noone;
if ( GAMEFLOW_DEBUG ) trace_v( "room=", room_get_name( room ), " (", room, ")" );