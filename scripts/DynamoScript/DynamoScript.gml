/// Sets up a script to watch for changes. If DYNAMO_AUTO_SCAN is set to <true> then watched
/// scripts will be scanned for changes automatically. If a script *has* changed then it will be
/// loaded, parsed, and applied. If you specified a callback function when calling
/// DynamoScript() then that will be executed after data in the script is applied.
/// 
/// Because data is being stored in a script and *not* instead a function, the code inside a
/// script is executed on boot by the GameMaker runtime as you'd expect. This means that, unlike
/// file watchers, data represented inside a Dynamo script is immediately available.
/// 
/// There are many limitations to what can be done with Dynamo and scripts. It's best to think
/// about Dynamo scripts as being as complex as JSON but no further. It is possible to reference
/// basic numbers and strings (of course!) as well as being able to nest arrays and structs as
/// you would in JSON. You may also reference asset names and GameMaker constants. You cannot,
/// however, create functions inside Dynamo scripts. You can't use conditional branching or loops
/// or anything that controls programme "flow". Dynamo is also expecting all variables you're
/// defining in the script to be globals.
/// 
/// If you call DynamoScriptLoad() then the script will be loaded and applied whether there have
/// been changes or not, and the callback will be executed as normal (if defined).
/// 
/// @param script
/// @param [callback]

function DynamoScript(_script, _callback = undefined)
{
    __DynamoInitialize();
    
    if (__DYNAMO_DEV_MODE)
    {
        if (!is_numeric(_script)) __DynamoError("Illegal datatype passed for the script index (was ", typeof(_script), ")");
        if (!script_exists(_script)) __DynamoError("Script with index ", _script, " doesn't exist");
        
        if (is_numeric(_callback))
        {
            if (!script_exists(_callback)) __DynamoError("Callback script with index ", _callback, " doesn't exist");
        }
        else if (!is_method(_callback) && (_callback != undefined))
        {
            __DynamoError("Illegal datatype passed for the callback (was ", typeof(_callback), ")");
        }
        
        var _scriptName = script_get_name(_script);
        if (variable_struct_exists(global.__dynamoScriptStruct, _scriptName)) __DynamoError("Script \"", _scriptName, "\" is already being watched");
        
        var _watcher = new __DynamoClassScript(_scriptName, global.__dynamoProjectDirectory + "scripts/" + string_lower(_scriptName) + "/" + string_lower(_scriptName) + ".gml");
        _watcher.__callback = _callback;
    }
}