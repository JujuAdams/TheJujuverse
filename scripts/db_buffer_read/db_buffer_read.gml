/// @param buffer

function db_buffer_read(_buffer)
{
    return __db_deserialize(buffer_read(_buffer, buffer_string));
}