// Feather disable all
/// Forces a script to be loaded, executing the callback defined for the script via DynamoScript() (if any).
/// 
/// @param script

function DynamoScriptLoad(_script)
{
    static _scriptStruct = __DynamoState().__scriptStruct;
    
    if (!is_numeric(_script)) __DynamoError("Illegal datatype passed for the script index (was ", typeof(_script), ")");
    if (!script_exists(_script)) __DynamoError("Script with index ", _script, " doesn't exist");
    
    var _scriptName = script_get_name(_script);
    var _tracker = _scriptStruct[$ _scriptName];
    if (_tracker == undefined) __DynamoError("\"", _scriptName, "\" hasn't been added with DynamoScript()");
    
    _tracker.__Load();
}
