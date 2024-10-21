// Feather disable all
/// Sets up an Included File to watch for changes. If DYNAMO_AUTO_SCAN is set to <true> then
/// watched Included Files will be scanned for changes automatically. You can check if a file has
/// changed by calling DynamoFileChanged() and the file can be loaded with DynamoFileLoad().
/// 
/// If you call DynamoFileLoad() then the Included File will be loaded whether there have been
/// changes or not, and the callback provided when calling DynamoFile() will be executed. The
/// callback will be handed two arguments: argument0 is the content parsed from the file (see
/// below) and argument1 is the callback data provided when calling DynamoFile(). If there're
/// any problems whilst parsing data found in a file then <undefined> will be passed to the
/// callback as argument0.
/// 
/// Dynamo will automatically parse the file depending on what value <dataFormat> is set to:
///    "json"      Content is parsed as JSON
///    "csv"       Content is parsed as CSV: comma-separated, with strings delimited by double quotes
///    "string"    Content is parsed as UTF8-formatted plaintext
///    "buffer"    Content is not parsed and content is instead returned to the callback as a buffer index
/// 
/// N.B. Much like GameMaker's native asynchronous load functionality, the buffer returned to the
///      callback is destroyed immediately after your callback function finishes executing. If you
///      want to keep the buffer data around then you'll need to make and keep a copy yourself.
/// 
/// If the <autoLoad> argument is set to <true> when calling DynamoFile() then the file will
/// automatically be loaded and parsed whenever a change is detected, executing the callback as
/// though DynamoFileLoad() had been called directly for the file.
/// 
/// Note that setting up a file watcher will not initially load a file. If you want immediate
/// access to data inside a file at the start of your game you'll need to call DynamoFileLoad().
/// 
/// @param path
/// @param dataFormat
/// @param autoLoad
/// @param callback
/// @param [callbackData]

function DynamoFile(_path, _dataFormat, _autoLoad, _callback, _callbackData = undefined)
{
    static __globalState = __DynamoState();
    
    var _adjustedPath = string_replace_all(_path, "\\", "/");
    var _directory = __DYNAMO_DEV_MODE? (__globalState.__projectDirectory + "datafiles/") : "";
    
    if (!file_exists(_directory + _adjustedPath))
    {
        __DynamoError("Warning! File \"", _directory + _path, "\" not found\nCheck that the file system sandbox is disabled");
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
            __DynamoError("Illegal data format provided (", _dataFormat, ")\nData format must be \"json\", \"csv\", \"text\", or \"buffer\"");
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
    
    if (variable_struct_exists(__globalState.__fileStruct, _path)) __DynamoError("File \"", _path, "\" is already being watched");
    
    var _watcher = new __DynamoClassFile(_path, _directory, _adjustedPath);
    _watcher.__dataFormat   = _dataFormat;
    _watcher.__autoLoad     = _autoLoad;
    _watcher.__callback     = _callback;
    _watcher.__callbackData = _callbackData;
}
