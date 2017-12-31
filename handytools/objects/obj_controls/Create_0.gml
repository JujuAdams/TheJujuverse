depth = -2000;
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
    
    var _key_map = tr_map_create( "keyboard input" );
    tr_map_add_map( _player_map, "keyboard mapping", _key_map );
    _key_map[? "left"        ] = ord( "A" );
    _key_map[? "right"       ] = ord( "D" );
    _key_map[? "up"          ] = ord( "W" );
    _key_map[? "down"        ] = ord( "S" );
    _key_map[? "mouse"       ] = mb_any;
    _key_map[? "sensitivity" ] = 0.5;
    
    var _button_map = tr_map_create( "gamepad input" );
    tr_map_add_map( _player_map, "gamepad mapping", _button_map );
    _button_map[? "left"       ] = gp_face3;
    _button_map[? "right"      ] = gp_face2;
    _button_map[? "up"         ] = gp_face4;
    _button_map[? "down"       ] = gp_face1;
    _button_map[? "mouse"      ] = gp_face1;
    _button_map[? "device"     ] = 0;
    _button_map[? "sensitivity"] = 5;
    
    var _state_map = tr_map_create( "input states" );
    tr_map_add_map( _player_map, "state", _state_map );
    _state_map[? "left"  ] = CTRL_OFF;
    _state_map[? "right" ] = CTRL_OFF;
    _state_map[? "up"    ] = CTRL_OFF;
    _state_map[? "down"  ] = CTRL_OFF;
    _state_map[? "mouse" ] = CTRL_OFF;
    
}

options_set_mappings();

if ( control_get( 0, "mode" ) == GAMEPAD ) {
    control_set( 0, "mouse", "point x", floor( cam_window_x_to_world( window_get_width()/2 ) ) );
    control_set( 0, "mouse", "point y", floor( cam_window_x_to_world( window_get_height()/2 ) ) );
}