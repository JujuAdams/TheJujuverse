///RUMBLE

if ( gamepad_button_check_pressed( 0, gp_face1 ) ) rumble_pulse( 0, 1, 3000, 10 );

var _l_power;
var _r_power;
_l_power[1] = 0;
_r_power[1] = 0;

var _size = ds_list_size( rumble_list );
for( var _event = _size-1; _event >= 0; _event-- ) {
    
    var _event_map = rumble_list[| _event ];
    
    var _start = _event_map[? "start" ];
    if ( current_time < _start ) continue;
    
    var _t = 0;
    var _duration = _event_map[? "duration" ];
    if ( current_time > _start + _duration ) {
        ds_list_delete( rumble_list, _event );
        continue;
    }
    _t = clamp( (current_time - _start) / _duration, 0, 1 );
    
    var _decay     = _event_map[? "decay" ];
    var _frequency = _event_map[? "frequency" ];
    var _l_max     = _event_map[? "left" ];
    var _r_max     = _event_map[? "right" ];
    var _player    = _event_map[? "player" ];
    
    if ( _decay ) {
        _l_max *= 1-_t;
        _r_max *= 1-_t;
    }
    
    if ( _frequency == undefined ) || ( _frequency == 0 ) || ( _frequency > 999 ) {
        _l_power[_player] += _l_max;
        _r_power[_player] += _r_max;
    } else {
        //var _wave = 0.5 + 0.5*dcos( _t*(360*_frequency-180) ); //cosine wave
        //var _wave = 0.5 + 0.5*dsin( _t*(360*_frequency-180) ); //sine wave
        var _wave = (floor( _t * (2*_frequency-1) ) mod 2) == 0; //square wave
        _l_power[_player] += _l_max*_wave;
        _r_power[_player] += _r_max*_wave;
    }
    
}

gamepad_set_vibration( global.js[0], clamp( _l_power[0], 0, 1 ), clamp( _r_power[0], 0, 1 ) );
gamepad_set_vibration( global.js[1], clamp( _l_power[1], 0, 1 ), clamp( _r_power[1], 0, 1 ) );