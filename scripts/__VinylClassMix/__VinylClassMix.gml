// Feather disable all

/// @param mixName
/// @param baseGain
/// @param membersLoop
/// @param membersDuckOn
/// @param metadata

function __VinylClassMix(_mixName, _gainPattern, _membersLoop, _membersDuckOn, _metadata) constructor
{
    static _toUpdateArray = __VinylSystem().__toUpdateArray;
    static _soundDict     = __VinylSystem().__soundDict;
    static _patternDict   = __VinylSystem().__patternDict;
    
    __mixName       = _mixName;
    __gainPattern   = _gainPattern;
    __membersLoop   = _membersLoop;
    __membersDuckOn = _membersDuckOn;
    __metadata      = _metadata;
    
    __gainLocal = 1;
    __gainFinal = _gainPattern;
    
    __gainLocalTarget = 1;
    __gainLocalSpeed  = infinity;
    
    __cleanUpIndex = 0;
    __voiceArray   = [];
    
    
    
    
    
    static __Update = function(_delta)
    {
        if (__gainLocal != __gainLocalTarget)
        {
            __gainLocal += _delta*clamp(__gainLocalTarget - __gainLocal, -__gainLocalSpeed, __gainLocalSpeed);
            __UpdateMemberGain();
        }
        
        var _array = __voiceArray;
        var _length = array_length(_array);
        if (_length > 0)
        {
            var _index = (__cleanUpIndex + 1) mod _length;
            if (not VinylIsPlaying(_array[_index])) array_delete(_array, _index, 1);
            __cleanUpIndex = _index;
        }
    }
    
    static __UpdateSetup = function(_gainPattern, _membersLoop, _membersDuckOn)
    {
        if (VINYL_LIVE_EDIT)
        {
            array_push(_toUpdateArray, self);
        }
        
        __gainPattern = _gainPattern;
        __membersLoop = _membersLoop;
        
        __UpdateMemberGain();
    }
    
    static __UpdateMemberGain = function()
    {
        var _gainFinal = __gainPattern*__gainLocal;
        __gainFinal = _gainFinal;
        
        var _array = __voiceArray;
        var _i = 0;
        repeat(array_length(_array))
        {
            __VinylEnsureSoundVoice(_array[_i]).__SetMixGain(_gainFinal);
            ++_i;
        }
    }
    
    static __ClearSetup = function()
    {
        __UpdateSetup(1, false, undefined);
    }
    
    static __Add = function(_voice)
    {
        array_push(__voiceArray, _voice);
    }
    
    static __Remove = function(_voice)
    {
        var _index = array_get_index(__voiceArray, _voice);
        if (_index >= 0) array_delete(__voiceArray, _index, 1);
    }
    
    static __VoicesStop = function()
    {
        var _i = 0;
        repeat(array_length(__voiceArray))
        {
            VinylStop(__voiceArray[_i]);
            ++_i;
        }
    }
    
    static __VoicesFadeOut = function(_rateOfChange)
    {
        var _i = 0;
        repeat(array_length(__voiceArray))
        {
            VinylFadeOut(__voiceArray[_i], _rateOfChange);
            ++_i;
        }
    }
    
    static __VoicesSetPause = function(_state)
    {
        if (_state)
        {
            var _i = 0;
            repeat(array_length(__voiceArray))
            {
                VinylSetPause(__voiceArray[_i], _state);
                ++_i;
            }
        }
        else
        {
            var _i = 0;
            repeat(array_length(__voiceArray))
            {
                VinylResume(__voiceArray[_i]);
                ++_i;
            }
        }
    }
    
    static __SetLocalGain = function(_gain, _rateOfChange)
    {
        __gainLocalTarget = _gain;
        __gainLocalSpeed  = _rateOfChange;
        
        if (_rateOfChange > 100)
        {
            __gainLocal = _gain;
            __UpdateMemberGain();
        }
    }
    
    static __ExportJSON = function(_soundExportedDict, _patternExportedDict, _ignoreEmpty)
    {
        static _methodContext = {
            __mixName:    undefined,
            __namesArray: undefined,
        };
        
        static _method = method(_methodContext,
        function(_name, _value)
        {
            if (_value.__mixName == __mixName) array_push(__namesArray, _name);
        });
        
        
        
        var _membersArray = [];
        _methodContext.__mixName = __mixName;
        
        
        
        var _namesArray = [];
        _methodContext.__namesArray = _namesArray;
        
        struct_foreach(_patternDict, _method);
        array_sort(_namesArray, true);
        
        var _i = 0;
        repeat(array_length(_namesArray))
        {
            var _name = _namesArray[_i];
            _patternExportedDict[$ _name] = true;
            array_push(_membersArray, _patternDict[$ _name].__ExportJSON());
            ++_i;
        }
        
        
        
        var _namesArray = [];
        _methodContext.__namesArray = _namesArray;
        
        struct_foreach(_soundDict, _method);
        array_sort(_namesArray, true);
        
        var _i = 0;
        repeat(array_length(_namesArray))
        {
            var _name = _namesArray[_i];
            _soundExportedDict[$ _name] = true;
            
            var _struct = _soundDict[$ _name].__ExportJSON(_ignoreEmpty);
            if (_struct != undefined) array_push(_membersArray, _struct);
            
            ++_i;
        }
        
        
        
        var _struct = {
            mix:      __mixName,
            members:  _membersArray,
        };
        
        if (__gainPattern != 1)
        {
            _struct.baseGain = __gainPattern;
        }
        
        if (__membersLoop != undefined)
        {
            _struct.membersLoop = __membersLoop;
        }
        
        return _struct;
    }
    
    static __ExportGML = function(_buffer, _useMacros, _soundExportedDict, _patternExportedDict, _ignoreEmpty)
    {
        static _methodContext = {
            __mixName:    undefined,
            __namesArray: undefined,
        };
        
        static _method = method(_methodContext,
        function(_name, _value)
        {
            if (_value.__mixName == __mixName) array_push(__namesArray, _name);
        });
        
        
        
        buffer_write(_buffer, buffer_text, "    {\n");
        buffer_write(_buffer, buffer_text, "        mix: ");
        
        if (_useMacros)
        {
            buffer_write(_buffer, buffer_text, __VinylGetMixMacro(__mixName));
            buffer_write(_buffer, buffer_text, ",\n");
        }
        else
        {
            buffer_write(_buffer, buffer_text, "\"");
            buffer_write(_buffer, buffer_text, __mixName);
            buffer_write(_buffer, buffer_text, "\",\n");
        }
        
        if (__gainPattern != 1)
        {
            buffer_write(_buffer, buffer_text, "        baseGain: ");
            buffer_write(_buffer, buffer_text, __gainPattern);
            buffer_write(_buffer, buffer_text, ",\n");
        }
        
        if (__membersLoop != undefined)
        {
            buffer_write(_buffer, buffer_text, "        membersLoop: ");
            buffer_write(_buffer, buffer_text, __membersLoop? "true" : "false");
            buffer_write(_buffer, buffer_text, ",\n");
        }
        
        buffer_write(_buffer, buffer_text, "        members: [\n");
        
        
        
        _methodContext.__mixName = __mixName;
        
        
        
        var _namesArray = [];
        _methodContext.__namesArray = _namesArray;
        
        struct_foreach(_patternDict, _method);
        array_sort(_namesArray, true);
        
        var _i = 0;
        repeat(array_length(_namesArray))
        {
            var _name = _namesArray[_i];
            _patternExportedDict[$ _name] = true;
            _patternDict[$ _name].__ExportGML(_buffer, "            ", _useMacros);
            ++_i;
        }
        
        
        
        var _namesArray = [];
        _methodContext.__namesArray = _namesArray;
        
        struct_foreach(_soundDict, _method);
        array_sort(_namesArray, true);
        
        var _i = 0;
        repeat(array_length(_namesArray))
        {
            var _name = _namesArray[_i];
            _soundExportedDict[$ _name] = true;
            _soundDict[$ _name].__ExportGML(_buffer, "            ", _ignoreEmpty);
            ++_i;
        }
        
        
        
        buffer_write(_buffer, buffer_text, "        ],\n    },\n");
    }
}

function __VinylImportMixGroupJSON(_json)
{
    if (VINYL_SAFE_JSON_IMPORT)
    {
        var _variableNames = struct_get_names(_json);
        var _i = 0;
        repeat(array_length(_variableNames))
        {
            switch(_variableNames[_i])
            {
                case "mix":
                case "baseGain":
                case "membersLoop":
                case "membersDuckOn":
                case "members":
                case "metadata":
                break;
                
                default:
                    __VinylError("Mix property .", _variableNames[_i], " not supported");
                break;
            }
            
            ++_i;
        }
    }
    
    VinylSetupMix(_json.mix, _json[$ "baseGain"], _json[$ "membersLoop"], _json[$ "membersDuckOn"], _json[$ "metadata"]);
    
    var _membersArray = _json[$ "members"];
    if (is_array(_membersArray))
    {
        var _i = 0;
        repeat(array_length(_membersArray))
        {
            var _memberData = _membersArray[_i];
            
            var _return = __VinylSetupImportJSONInner(_memberData);
            if (_return != undefined) VinylSetMixForAssets(_json.mix, _return);
            
            ++_i;
        }
    }
    
    return _json.mix;
}