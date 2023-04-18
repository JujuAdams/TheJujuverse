/// @param path
/// @param [fallbackValue=""]

function __DynamoLoadString(_path, _fallback = "")
{
    try
    {
        var _buffer = buffer_load(_path);
        var _string = buffer_read(_buffer, buffer_string);
        buffer_delete(_buffer);
        
        return _string;
    }
    catch(_error)
    {
        __DynamoTrace("Warning! Error encountered during load of \"", _path, "\"\n", _error);
        return _fallback;
    }
}