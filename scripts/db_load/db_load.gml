function db_load(_filename)
{
    if (!file_exists(_filename)) __db_error("Could not find \"", _filename, "\"");
    
    var _buffer   = undefined;
    var _database = undefined;
    
    try
    {
        _buffer = buffer_load(_filename);
        _database = __db_deserialize(buffer_read(_buffer, buffer_text));
        buffer_delete(_buffer);
    }
    catch(_error)
    {
        
    }
    
    if ((_buffer != undefined) && (_buffer > 0)) buffer_delete(_buffer);
    
    return _database;
}