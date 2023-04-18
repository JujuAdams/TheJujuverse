// Basic XORShift32, nothing fancy
// 
// @param value

function __VinylRandom(_value)
{
    static _state = floor(1000000*date_current_datetime() + display_mouse_get_x() + display_get_width()*display_mouse_get_y());
    _state ^= _state << 13;
    _state ^= _state >> 17;
    _state ^= _state <<  5;
    return _value * abs(_state) / (real(0x7FFFFFFFFFFFFFFF) + 1.0);
}

function __VinylRandomBool()
{
    static _state = floor(1000000*date_current_datetime() + display_mouse_get_x() + display_get_width()*display_mouse_get_y());
    _state ^= _state << 13;
    _state ^= _state >> 17;
    _state ^= _state <<  5;
    return (_state & 0x01);
}