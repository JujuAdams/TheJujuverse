var _root_list = json_read( global.options_json, "controls" );

//Set remote player input to off
var _size = ds_list_size( _root_list );
for( var _p = 0; _p < _size; _p++ ) {
    
    var _player_map = _root_list[| _p ];
    if ( !_player_map[?"remote"] ) continue;
    
    var _mapping_map = _player_map[? "keyboard mapping" ];
    var _state_map = _player_map[?"state"];
	
	_state_map[?"mouse"] = CTRL_OFF;
	for( var _i = 0; _i < global.control_master_total; _i++ ) _state_map[? global.control_master_list[| _i ] ] = CTRL_OFF;
    
}

//F4 screen toggling
if ( ALLOW_F4_FULLSCREEN && keyboard_check_pressed( vk_f4 ) ) {
    if ( RESOLUTION_ON ) {
        resolution_toggle_fullscreen();
    } else {
        options_set( "fullscreen", !options_get( "fullscreen" ) );
        window_set_fullscreen( options_get( "fullscreen" ) );
        on_fullscreen_toggle();
    }
}