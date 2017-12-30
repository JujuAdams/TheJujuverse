var _options_root_list = global.options_json[? "controls" ];
if ( _options_root_list == undefined ) exit;
var _root_list = obj_controls.controls_list;

for( var _i = 0; _i < MAX_PLAYERS; _i++ ) {
    
    var _options_player_map = _options_root_list[| _i ];
    var _player_map = _root_list[| _i ];
    
    if ( _player_map[? "mode" ] == KEYBOARD ) _options_player_map[? "mode" ] = "KEYBOARD";
                                         else _options_player_map[? "mode" ] = "GAMEPAD";
    
    var _options_key_map = _options_player_map[? "keyboard mapping" ];
    var         _key_map =         _player_map[? "keyboard mapping" ];
    _options_key_map[? "mouse"       ] = control_mouse_to_name( _key_map[? "mouse" ] );
    _options_key_map[? "sensitivity" ] = _key_map[? "sensitivity" ];
    
    var _options_button_map = _options_player_map[? "gamepad mapping" ];
    var         _button_map =         _player_map[? "gamepad mapping" ];
    _options_button_map[? "mouse"       ] = control_name_to_gamepad( _button_map[? "mouse" ] );
    _options_button_map[? "device"      ] = _button_map[? "device" ];
    _options_button_map[? "sensitivity" ] = _button_map[? "sensitivity" ];
    
    var _size = ds_list_size( global.control_master_list );
    for( var _i = 0; _i < _size; _i++ ) {
        var _control = global.control_master_list[| _i ];
        _options_key_map[?    _control ] = control_key_to_name(     _key_map[?    _control ] );
        _options_button_map[? _control ] = control_gamepad_to_name( _button_map[? _control ] );
    }
    /*
    var _control = "left";      _options_key_map[?    _control ] = control_key_to_name(     _key_map[?    _control ] );
                                _options_button_map[? _control ] = control_gamepad_to_name( _button_map[? _control ] );
        _control = "right";     _options_key_map[?    _control ] = control_key_to_name(     _key_map[?    _control ] );
                                _options_button_map[? _control ] = control_gamepad_to_name( _button_map[? _control ] );
        _control = "fire";      _options_key_map[?    _control ] = control_key_to_name(     _key_map[?    _control ] );
                                _options_button_map[? _control ] = control_gamepad_to_name( _button_map[? _control ] );
        _control = "talk";      _options_key_map[?    _control ] = control_key_to_name(     _key_map[?    _control ] );
                                _options_button_map[? _control ] = control_gamepad_to_name( _button_map[? _control ] );
        _control = "alt left";  _options_key_map[?    _control ] = control_key_to_name(     _key_map[?    _control ] );
                                _options_button_map[? _control ] = control_gamepad_to_name( _button_map[? _control ] );
        _control = "alt right"; _options_key_map[?    _control ] = control_key_to_name(     _key_map[?    _control ] );
                                _options_button_map[? _control ] = control_gamepad_to_name( _button_map[? _control ] );
        _control = "alt fire";  _options_key_map[?    _control ] = control_key_to_name(     _key_map[?    _control ] );
                                _options_button_map[? _control ] = control_gamepad_to_name( _button_map[? _control ] );
        _control = "back";      _options_key_map[?    _control ] = control_key_to_name(     _key_map[?    _control ] );
                                _options_button_map[? _control ] = control_gamepad_to_name( _button_map[? _control ] );
    */
}