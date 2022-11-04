/// @param path

function __DynamoFileHash(_path)
{
    try
    {
        if (!file_exists(_path)) return "d41d8cd98f00b204e9800998ecf8427e";
        return md5_file(_path);
    }
    catch(_error)
    {
        __DynamoTrace("Warning! Could not calculate hash for \"", _path, "\"\n", _error);
        return undefined;
    }
}