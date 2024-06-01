// Feather disable all
function SnitchGenerateUUID4String(_hyphenate = false)
{
    //As per https://www.cryptosys.net/pki/uuid-rfc4122.html (though without the hyphens)
    var _UUID = md5_string_unicode(string(current_time) + string(date_current_datetime()) + string(__SnitchXORShift32Random(1000000)));
    _UUID = string_set_byte_at(_UUID, 13, ord("4"));
    _UUID = string_set_byte_at(_UUID, 17, ord(__SnitchXORShift32Choose("8", "9", "a", "b")));
    
    if (_hyphenate)
    {
        _UUID = string_copy(_UUID, 1, 8) + "-" + string_copy(_UUID, 9, 4) + "-" + string_copy(_UUID, 13, 4) + "-" + string_copy(_UUID, 17, 4) + "-" + string_copy(_UUID, 21, 12);
    }
    
    return _UUID;
}

////Set up the XORShift32 starting seed
////Can throw in a randomize() / random() call here too if you'd like but 1) that might mess up other stuff? 2) feels unnecessary
//__SnitchState().__XORShift32State = floor(1000000*date_current_datetime() + display_mouse_get_x() + display_get_width()*display_mouse_get_y());

//Basic XORShift32, nothing fancy
function __SnitchXORShift32Random(_value)
{
    static _state = floor(1000000*date_current_datetime() + display_mouse_get_x() + display_get_width()*display_mouse_get_y());
    _state ^= _state << 13;
    _state ^= _state >> 17;
    _state ^= _state <<  5;
    return _value * abs(_state) / (real(0x7FFFFFFFFFFFFFFF) + 1.0);
}

function __SnitchXORShift32Choose()
{
    return argument[floor(__SnitchXORShift32Random(argument_count))];
}
