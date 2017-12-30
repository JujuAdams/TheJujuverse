///gamepad_axis_value_any()

var _axis = argument0;

var _max_value = 0;

for( var _i = 0; _i < 12; _i++ ) {
    if ( !gamepad_is_connected( _i ) ) continue;
    var _value = gamepad_axis_value( _i, _axis );
    if ( abs( _value ) > _max_value ) _max_value = _value;
}

return _max_value;