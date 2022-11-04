function __DynamoClassNote(_name, _hash, _buffer) constructor
{
    __name   = _name;
    __buffer = _buffer;
    
    __path = global.__dynamoProjectDirectory + "notes/" + string_lower(__name) + "/" + string_lower(__name) + ".txt";
    
    array_push(global.__dynamoNoteArray, self);
    global.__dynamoNoteStruct[$ __name] = self;
    array_push(global.__dynamoTrackingArray, self);
    
    __hash = __DYNAMO_DEV_MODE? _hash : undefined;
    
    __dataFormat = undefined;
    __callback   = undefined;
    
    
    
    static toString = function()
    {
        return __name;
    }
    
    static __HasChanged = function()
    {
        if (!__DYNAMO_DEV_MODE) return false;
        if (__dataFormat == undefined) return false;
        return (__DynamoFileHash(__path) != __hash);
    }
    
    static __Load = function()
    {
        if (__DYNAMO_DEV_MODE)
        {
            if (__buffer != undefined) buffer_delete(__buffer);
            
            if (file_exists(__path))
            {
                __hash = __DynamoFileHash(__path);
                __buffer = __DynamoLoadBuffer(__path);
            }
            else
            {
                __buffer = buffer_create(0, buffer_grow, 1);
            }
        }
        
        var _return = undefined;
        if (__buffer != undefined)
        {
            switch(__dataFormat)
            {
                case "json":
                    var _oldTell = buffer_tell(__buffer);
                    _return = buffer_read(__buffer, buffer_text);
                    buffer_seek(__buffer, buffer_seek_start, _oldTell);
                    
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
                    var _oldTell = buffer_tell(__buffer);
                    _return = buffer_read(__buffer, buffer_text);
                    buffer_seek(__buffer, buffer_seek_start, _oldTell);
                    
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
                    if (buffer_get_size(__buffer) == 0)
                    {
                        _return = "";
                    }
                    else
                    {
                        var _oldTell = buffer_tell(__buffer);
                        var _return = buffer_read(__buffer, buffer_text);
                        buffer_seek(__buffer, buffer_seek_start, _oldTell);
                    }
                break;
                
                case "buffer":
                    _return = __buffer;
                break;
                
                case undefined:
                    __DynamoError("Note \"", __name, "\" hasn't been added using DynamoNote()");
                break;
                
                default:
                    __DynamoError("Illegal data format (", __dataFormat, ") for file \"", __path, "\"");
                break;
            }
        }
        
        if (is_method(__callback))
        {
            __callback(_return);
        }
        else if (is_numeric(__callback) && script_exists(__callback))
        {
            script_execute(__callback, _return);
        }
        else
        {
            __DynamoError("Illegal callback for file \"", __path, "\"");
        }
    }
}