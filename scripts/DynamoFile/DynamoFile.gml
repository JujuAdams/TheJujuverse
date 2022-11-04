/// Sets up an Included File to watch for changes. If DYNAMO_AUTO_SCAN is set to <true> then
/// watched Included Files will be scanned for changes automatically. If a file *has* changed
/// then it will be loaded and parsed. The parsed data will be passed into the callback function
/// defined when calling DynamoFile().
/// 
/// If you call DynamoFileLoad() then the Included File will be loaded whether there have been
/// changes or not, and the callback will be executed as normal.
/// 
/// Note that setting up a file watcher will not initially load a file. If you want immediate
/// access to data inside a file at the start of your game you'll need to call DynamoFileLoad().
/// 
/// If there're any problems whilst parsing data found in a file then <undefined> will be passed
/// to the callback.
/// 
/// <dataFormat> can be:
///    "json"      Content is parsed as JSON
///    "csv"       Content is parsed as CSV: comma-separated, with strings delimited by double quotes
///    "string"    Content is parsed as UTF8-formatted plaintext
///    "buffer"    Content is not parsed and content is instead returned to the callback as a buffer index
/// 
/// N.B. Much like GameMaker's native asynchronous load functionality, the buffer returned to the
///      callback is destroyed immediately after your callback function finishes executing. If you
///      want to keep the buffer data around then you'll need to make and keep a copy yourself.
/// 
/// @param path
/// @param dataFormat
/// @param callback

function DynamoFile(_path, _dataFormat, _callback)
{
    __DynamoInitialize();
    
    var _adjustedPath = string_replace_all(_path, "\\", "/");
    var _directory = __DYNAMO_DEV_MODE? (global.__dynamoProjectDirectory + "datafiles/") : "";
    
    if (!file_exists(_directory + _adjustedPath))
    {
        __DynamoError("Warning! File \"", _directory + _path, "\" not found");
    }
    
    _dataFormat = string_lower(_dataFormat);
    switch(_dataFormat)
    {
        case "json":
        case "csv":
        case "string":
        case "buffer":
        break;
        
        default:
            __DynamoError("Illegal data format provided (", _dataFormat, ")\nData format must be \"json\", \"csv\", \"text\", or \"binary\"");
        break;
    }
    
    if (is_numeric(_callback))
    {
        if (!script_exists(_callback)) __DynamoError("Callback script with index ", _callback, " doesn't exist");
    }
    else if (!is_method(_callback))
    {
        __DynamoError("Illegal datatype passed for the callback (was ", typeof(_callback), ")");
    }
    
    if (variable_struct_exists(global.__dynamoScriptStruct, _path)) __DynamoError("File \"", _path, "\" is already being watched");
    
    var _watcher = new __DynamoClassFile(_path, _directory, _adjustedPath);
    _watcher.__dataFormat = _dataFormat;
    _watcher.__callback   = _callback;
}