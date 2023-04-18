/// @param path

function __DynamoLoadBuffer(_path)
{
    try
    {
        var _buffer = buffer_load(_path);
        if (_buffer < 0) return undefined;
        return _buffer;
    }
    catch(_error)
    {
        __DynamoTrace("Warning! Error encountered during load of \"", _path, "\"\n", _error);
        return undefined;
    }
}