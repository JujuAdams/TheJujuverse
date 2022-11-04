/// Forces an Included File to be loaded, executing the callback defined for the file via DynamoFile().
/// 
/// @param path

function DynamoFileLoad(_path)
{
    __DynamoInitialize();
    
    var _tracker = global.__dynamoFileStruct[$ _path];
    if (_tracker == undefined) __DynamoError("\"", _path, "\" hasn't been added with DynamoWatchFile()");
    
    _tracker.__Load();
}