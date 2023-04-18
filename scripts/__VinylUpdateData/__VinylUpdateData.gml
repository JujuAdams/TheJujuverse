function __VinylUpdateData()
{
    static _globalData     = __VinylGlobalData();
    static _topLevelArray  = _globalData.__topLevelArray;
    static _animCurveArray = _globalData.__animCurveArray;
    static _configFileHash = undefined;
    
    //Use a var here because <__updateCallback> can change
    var _callback = _globalData.__updateCallback;
    
    var _firstUpdate = (_configFileHash == undefined);
    var _reloadConfig = false;
    
    
    //Always allow data to be updated once on boot
    if (!_globalData.__liveUpdate && (_configFileHash != undefined)) return;
    
    var _filename = __VinylGetDatafilePath();
    
    if (__VinylGetLiveUpdateEnabled())
    {
        if (!file_exists(_filename))
        {
            __VinylError("Could not find \"", _filename, "\"\n- Ensure that \"", __VINYL_CONFIG_NOTE_NAME, "\" exists as a Notes asset in your project\n- Turn on the \"Disable file system sandbox\" game option for this platform");
            return;
        }
        
        var _foundHash = md5_file(_filename);
        if (_foundHash != _configFileHash) _reloadConfig = true;
        _configFileHash = _foundHash;
    }
    else
    {
        //Only load once in non-live update mode
        if (_configFileHash != undefined) return false;
        
        var _filename = __VINYL_DATA_BUNDLE_FILENAME;
        var _foundHash = "loaded";
        
        _reloadConfig = true;
    }
    
    //If we have animation curves then spin around the array checking for changes
    var _reloadCurves = false;
    var _i = 0;
    repeat(array_length(_animCurveArray))
    {
        if (_animCurveArray[_i].__Reload()) _reloadCurves = true;
        ++_i;
    }
    
    if (!_reloadConfig)
    {
        //We don't need to reload the main config file but we do need to update Multi pattern blend weights
        if (_reloadCurves)
        {
            var _i = 0;
            repeat(array_length(_topLevelArray))
            {
                _topLevelArray[_i].__ApplyBlendFactorRecursive();
                ++_i;
            }
        }
        
        return false;
    }
    
    var _success = undefined;
    var _t = get_timer();
    
    try
    {
        var _buffer = buffer_load(_filename);
        try
        {
            var _data = __VinylBufferReadConfigJSON(_buffer, 0);
            __VinylTrace("Read config in plaintext");
        }
        catch(_error)
        {
            buffer_seek(_buffer, buffer_seek_start, 0);
            var _string = buffer_read(_buffer, buffer_text);
            buffer_delete(_buffer);
            _buffer = buffer_base64_decode(_string);
            var _data = __VinylBufferReadConfigJSON(_buffer, 0);
            
            __VinylTrace("Read config in base64");
        }
        
        _success = true;
        __VinylTrace("Loaded data in ", (get_timer() - _t)/1000, "ms");
        
        var _t = get_timer();
        VinylSystemReadConfig(_data);
        __VinylTrace("Read data in ", (get_timer() - _t)/1000, "ms");
    }
    catch(_error)
    {
        show_debug_message("");
        __VinylTrace("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        __VinylTrace("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        __VinylTrace(_error.longMessage);
        __VinylTrace(_error.stacktrace);
        __VinylTrace("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        __VinylTrace("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        show_debug_message("");
        
        var _trimmedMessage = string_replace(_error.message, "Vinyl:\n", "");
        _trimmedMessage = string_copy(_trimmedMessage, 1, string_length(_trimmedMessage)-2);
        
        if (_firstUpdate)
        {
            __VinylError("There was an error whilst reading \"", _filename, "\"\n \n", _trimmedMessage);
        }
        else
        {
            _trimmedMessage = string_replace_all(_trimmedMessage, "\n", "\n       ");
            __VinylTrace("There was an error whilst reading \"", _filename, "\"");
            __VinylTrace(_trimmedMessage);
        }
    }
    finally
    {
        buffer_delete(_buffer);
    }
    
    //Execute the callback on success
    if (_success)
    {
        if (is_method(_callback))
        {
            _callback();
        }
        else if (is_numeric(_callback))
        {
            if (script_exists(_callback))
            {
                script_execute(_callback);
            }
            else
            {
                __VinylError("Script ", _callback, " set as live update callback doesn't exist");
            }
        }
        else if (_callback != undefined)
        {
            __VinylError("Live update callback definition is invalid (typeof=", typeof(_callback), ")");
        }
    }
    
    return _success;
}