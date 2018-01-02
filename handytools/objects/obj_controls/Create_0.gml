depth = CONTROLS_DEPTH;
persistent = true;

var _mouse_x = window_mouse_get_x();
var _mouse_y = window_mouse_get_y();

controls_list = tr_list_create( "root controls list" );
for( var _i = 0; _i < MAX_PLAYERS; _i++ ) {
    
    var _player_map = tr_map_create( "player input" );
    tr_list_add_map( controls_list, _player_map );
    
    _player_map[? "remote" ] = false;
    
    var _mouse_map = tr_map_create( "mouse input" );
    tr_map_add_map( _player_map, "mouse", _mouse_map );
    _mouse_map[? "point x"   ] = _mouse_x;
    _mouse_map[? "point y"   ] = _mouse_y;
    _mouse_map[? "aim x"     ] = 0;
    _mouse_map[? "aim y"     ] = 0;
    _mouse_map[? "dx"        ] = 0;
    _mouse_map[? "dy"        ] = 0;
    _mouse_map[? "lock"      ] = false;
    _mouse_map[? "lock time" ] = current_time;
    
    tr_map_add_map( _player_map, "keyboard mapping", tr_map_create( "keyboard input" ) );
    tr_map_add_map( _player_map, "gamepad mapping",  tr_map_create( "gamepad input"  ) );
    tr_map_add_map( _player_map, "state"           , tr_map_create( "input states"   ) );
    
}

options_set_mappings();

if ( control_get( 0, "mode" ) == GAMEPAD ) {
    control_set( 0, "mouse", "point x", floor( cam_window_x_to_world( window_get_width()/2 ) ) );
    control_set( 0, "mouse", "point y", floor( cam_window_x_to_world( window_get_height()/2 ) ) );
}