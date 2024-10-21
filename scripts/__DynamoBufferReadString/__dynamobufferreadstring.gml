// Feather disable all
/// @param buffer
/// @param start
/// @param end

function __DynamoBufferReadString(_buffer, _start, _end)
{
    var _oldValue = buffer_peek(_buffer, _end+1, buffer_u8);
    buffer_poke(_buffer, _end+1, buffer_u8, 0x0);
    buffer_seek(_buffer, buffer_seek_start, _start);
    var _string = buffer_read(_buffer, buffer_string);
    buffer_poke(_buffer, _end+1, buffer_u8, _oldValue);
    return _string;
}
