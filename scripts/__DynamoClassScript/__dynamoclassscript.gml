function __DynamoClassScript(_name, _path) constructor
{
    __name = _name;
    __path = _path;
    
    var _globalState = __DynamoState();
    array_push(_globalState.__scriptArray, self);
    _globalState.__scriptStruct[$ __name] = self;
    array_push(_globalState.__trackingArray, self);
    
    __hash = __DYNAMO_DEV_MODE? __DynamoFileHash(__path) : undefined;
    __changed = false;
    
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
        if (!__DYNAMO_DEV_MODE) return;
        
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
        if (!__DYNAMO_DEV_MODE) return;
        
        try
        {
            var _string = __DynamoLoadString(__path, "");
            var _data = __DynamoParseGML(_string);
        }
        catch(_error)
        {
            __DynamoTrace("Warning! Error encountered whilst parsing \"", __path, "\" as a script");
            show_debug_message(_error);
            return;
        }
        
        if (!is_struct(_data))
        {
            __DynamoTrace("Warning! Could not apply content for \"", __path, "\"");
            return;
        }
        
        var _topLevelNamesArray = variable_struct_get_names(_data);
        var _i = 0;
        repeat(array_length(_topLevelNamesArray))
        {
            var _topLevelName = _topLevelNamesArray[_i];
            
            if (string_copy(_topLevelName, 1, 7) != "global.")
            {
                __DynamoTrace("Warning! Top level name \"", _topLevelName, "\" is invalid");
                ++_i;
                continue;
            }
            
            var _variableName = string_delete(_topLevelName, 1, 7);
            var _value = _data[$ _topLevelName];
            
            if (DYNAMO_VERBOSE) __DynamoTrace("Setting \"", _topLevelName, "\" to ", typeof(_value));
            variable_global_set(_variableName, _value);
            
            ++_i;
        }
        
        if (is_method(__callback))
        {
            __callback(__callbackData);
        }
        else if (is_numeric(__callback) && script_exists(__callback))
        {
            script_execute(__callback, __callbackData);
        }
        else if (!is_undefined(__callback))
        {
            __DynamoError("Illegal callback for script \"", __name, "\"");
        }
    }
}