var _result = 0;

var _size = gamepad_get_device_count();
for( var _i = 0; _i < _size; _i++ ) if ( gamepad_is_connected( _i ) ) _result++;

return _result;