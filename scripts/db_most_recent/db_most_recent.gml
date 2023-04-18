/// @param arrayOfDatabases
/// @param [returnIndex=false]

function db_most_recent(_array, _return_index = false)
{
    var _max_database  = undefined;
    var _max_index     = undefined;
    var _max_timestamp = -infinity;
    
    var _i = 0;
    repeat(array_length(_array))
    {
        var _database = _array[_i];
        if (_database.__timestamp > _max_timestamp)
        {
            _max_database  = _database;
            _max_index     = _i;
            _max_timestamp = _database.__timestamp;
        }
        
        ++_i;
    }
    
    return _return_index? _max_index : _max_timestamp;
}