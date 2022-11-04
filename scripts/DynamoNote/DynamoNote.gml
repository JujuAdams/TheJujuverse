/// Sets up a note file to watch for changes. If DYNAMO_AUTO_SCAN is set to <true> then watched
/// Notes will be scanned for changes automatically. If a note files *has* changed then it will be
/// loaded and parsed. The parsed data will be passed into the callback function defined when
/// calling DynamoNote().
/// 
/// If you call DynamoNoteLoad() then the Note will be loaded whether there have been
/// changes or not, and the callback will be executed as normal.
/// 
/// Note that setting up a note watcher will not initially load a note. If you want immediate
/// access to data inside a file at the start of your game you'll need to call DynamoNoteLoad().
/// 
/// If there're any problems whilst parsing data found in a file then <undefined> will be passed
/// to the callback.
/// 
/// Note files are all included automatically when compiling your game. If you'd like to exclude a
/// note file from your compiled game then add the tag "dynamo ignore" to that note asset.
/// 
/// <dataFormat> can be:
///    "json"      Content is parsed as JSON
///    "csv"       Content is parsed as CSV: comma-separated, with strings delimited by double quotes
///    "string"    Content is parsed as UTF8-formatted plaintext
///    "buffer"    Content is not parsed and content is instead returned to the callback as a buffer index
/// 
/// N.B. Unlike GameMaker's native asynchronous load functionality, the buffer returned to the
///      callback is *NOT* destroyed immediately after your callback function finishes executing.
/// 
/// @param name
/// @param dataFormat
/// @param callback

function DynamoNote(_note, _dataFormat, _callback)
{
    __DynamoInitialize();
    
    if (!global.__dynamoNoteDataExists)
    {
        __DynamoError("Note data not found, this may indicate a compilation error\nPlease reload your project in the GameMaker IDE\nIf the issue persists, please report this crash");
    }
    
    if (!variable_struct_exists(global.__dynamoNoteStruct, _note))
    {
        __DynamoError("Note \"", _note, "\" not found");
    }
    
    if (variable_struct_exists(global.__dynamoNoteAddedStruct, _note))
    {
        __DynamoError("Watcher for note \"", _note, "\" already created");
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
    
    var _watcher = global.__dynamoNoteStruct[$ _note];
    _watcher.__dataFormat = _dataFormat;
    _watcher.__callback   = _callback;
    
    global.__dynamoNoteAddedStruct[$ _note] = true;
}
