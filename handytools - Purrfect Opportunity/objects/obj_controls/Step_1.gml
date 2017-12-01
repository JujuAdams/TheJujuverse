var _root_list = json_read( global.options_json, "controls" );

var _size = ds_list_size( _root_list );
for( var _p = 0; _p < _size; _p++ ) {
	
	var _player_map = _root_list[| _p ];
	if ( !_player_map[?"remote"] ) continue;
	
	var _state_map = _player_map[?"state"];
	_state_map[?"left" ] = OFF;
	_state_map[?"right"] = OFF;
	_state_map[?"up"   ] = OFF;
	_state_map[?"down" ] = OFF;
	
}