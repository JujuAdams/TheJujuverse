// Feather disable all
function __DynamoClassFile(_name, _directory, _localPath) constructor
{
    __name = _name;
    __path = _directory + _localPath;
    
    var _globalState = __DynamoState();
    array_push(_globalState.__fileArray, self);
    _globalState.__fileStruct[$ __name] = self;
    array_push(_globalState.__trackingArray, self);
    
    __hash = __DYNAMO_DEV_MODE? __DynamoFileHash(__path) : undefined;
    __changed = false;
    
    __dataFormat   = undefined;
    __autoLoad     = false;
    __callback     = undefined;
    __callbackData = undefined;
    
    
    
    static toString = function()
    {
        return __name;
    }
    
    static __TestHashDifferent = function()
    {
        if (!__DYNAMO_DEV_MODE) return false;
        
        return (__DynamoFileHash(__path) != __hash);
    }
    
    static __DetectChange = function()
    {
        if (!__DYNAMO_DEV_MODE) return false;
        
        var _foundHash = __DynamoFileHash(__path);
        if (_foundHash != __hash)
        {
            __hash = _foundHash;
            __changed = true;
            return true;
        }
        
        return false;
    }
    
    static __HasChanged = function()
    {
        if (__DYNAMO_DEV_MODE && __changed)
        {
            __changed = false;
            return true;
        }
        
        return false;
    }
    
    static __AutoLoad = function()
    {
        if (__autoLoad) __Load();
    }
    
    static __Load = function()
    {
        var _buffer = __DynamoLoadBuffer(__path);
        
        var _return = undefined;
        if (_buffer != undefined)
        {
            switch(__dataFormat)
            {
                case "json":
                    var _oldTell = buffer_tell(_buffer);
                    _return = buffer_read(_buffer, buffer_text);
                    buffer_seek(_buffer, buffer_seek_start, _oldTell);
                    
                    try
                    {
                        _return = __DynamoParseJSON(_return);
                    }
                    catch(_error)
                    {
                        __DynamoTrace("Error encountered whilst parsing \"", __path, "\" as JSON");
                        show_debug_message(_error);
                        _return = undefined;
                    }
                break;
                
                case "csv":
                    var _oldTell = buffer_tell(_buffer);
                    _return = buffer_read(_buffer, buffer_text);
                    buffer_seek(_buffer, buffer_seek_start, _oldTell);
                    
                    try
                    {
                        _return = __DynamoParseCSV(_return);
                    }
                    catch(_error)
                    {
                        __DynamoTrace("Error encountered whilst parsing \"", __path, "\" as CSV");
                        show_debug_message(_error);
                        _return = undefined;
                    }
                break;
                
                case "string":
                    if (buffer_get_size(_buffer) == 0)
                    {
                        _return = "";
                    }
                    else
                    {
                        var _oldTell = buffer_tell(_buffer);
                        var _return = buffer_read(_buffer, buffer_text);
                        buffer_seek(_buffer, buffer_seek_start, _oldTell);
                    }
                break;
                
                case "buffer":
                    _return = _buffer;
                break;
                
                default:
                    __DynamoError("Illegal data format (", __dataFormat, ") for file \"", __path, "\"");
                break;
            }
        }
        
        if (is_method(__callback))
        {
            __callback(_return, __callbackData);
        }
        else if (is_numeric(__callback) && script_exists(__callback))
        {
            script_execute(__callback, _return, __callbackData);
        }
        else
        {
            __DynamoError("Illegal callback for file \"", __path, "\"");
        }
        
        if (_buffer != undefined) buffer_delete(_buffer);
    }
}
