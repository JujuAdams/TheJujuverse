/// Returns whether the Included File on disk has changed since the last time Dynamo loaded it. If
/// your game isn't running from the IDE or DYNAMO_ENABLED is set to <false> this function will
/// always return <false>.
/// 
/// @param path

function DynamoFileChanged(_path)
{
    __DynamoInitialize();
    if (!__DYNAMO_DEV_MODE) return false;
    
    var _tracker = global.__dynamoFileStruct[$ _path];
    if (_tracker == undefined) __DynamoError("\"", _path, "\" hasn't been added with DynamoFile()");
    
    return _tracker.__HasChanged();
}