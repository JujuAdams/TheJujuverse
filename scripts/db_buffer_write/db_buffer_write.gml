/// @param buffer
/// @param database
/// @param [pretty=false]
/// @param [accurateFloats=false]

function db_buffer_write(_buffer, _database, _pretty = false, _accurate_floats = false)
{
    __db_buffer_write_json(_buffer,
                           {
                               data:      _database.__data,
                               metadata:  _database.__metadata,
                               timestamp: _database.__timestamp,
                               version:   1,
                           },
                           _pretty, _pretty, _accurate_floats);
}