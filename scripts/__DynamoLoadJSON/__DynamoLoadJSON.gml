/// @param path
/// @param fallbackToStruct

function __DynamoLoadJSON(_path, _fallbackToStruct)
{
    try
    {
        return json_parse(__DynamoLoadString(_path));
    }
    catch(_error)
    {
        __DynamoTrace("Warning! Error encountered during JSON decode of \"", _path, "\"\n", _error);
        
        if (is_bool(_fallbackToStruct))
        {
            return (_fallbackToStruct)? {} : [];
        }
        else
        {
            return _fallbackToStruct;
        }
    }
}