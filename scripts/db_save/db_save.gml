/// @param database
/// @param filename
/// @param [pretty=false]
/// @param [accurateFloats=false]

function db_save(_database, _filename, _pretty = false, _accurate_floats = false)
{
    var _buffer = buffer_create(1024, buffer_grow, 1);
    db_buffer_write(_buffer, _database, _pretty, _accurate_floats);
    buffer_save_ext(_buffer, _filename, 0, buffer_tell(_buffer));
    buffer_delete(_buffer);
}