/// Returns whether the script file on disk has changed since the last time DynamoScriptChanged()
/// was called (targetting that script file).
/// 
/// If your game isn't running from the IDE or DYNAMO_ENABLED is set to <false> this function will
/// always return <false>.
/// 
/// @param path

function DynamoScriptChanged(_path)
{
    if (!__DYNAMO_DEV_MODE) return false;
    
    static _scriptStruct = __DynamoState().__scriptStruct;
    
    var _tracker = _scriptStruct[$ _path];
    if (_tracker == undefined) __DynamoError("\"", _path, "\" hasn't been added with DynamoScript()");
    
    return _tracker.__HasChanged();
}