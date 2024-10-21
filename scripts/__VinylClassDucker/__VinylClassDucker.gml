// Feather disable all

/// @param duckerName
/// @param duckedGain
/// @param rateOfChange
/// @param samePriorityInterrupt

function __VinylClassDucker(_duckerName, _duckedGain, _rateOfChange, _samePriorityInterrupt) constructor
{
    static _toUpdateArray = __VinylSystem().__toUpdateArray;
    
    __duckerName            = _duckerName;
    __duckedGain            = _duckedGain;
    __rateOfChange          = _rateOfChange;
    __samePriorityInterrupt = _samePriorityInterrupt;
    
    __maxPriority   = -infinity;
    __voiceArray    = [];
    __priorityArray = [];
    
    
    
    
    
    static __UpdateSetup = function(_duckedGain, _rateOfChange, _samePriorityInterrupt)
    {
        static _priorityMap = ds_map_create();
        
        if (VINYL_LIVE_EDIT)
        {
            array_push(_toUpdateArray, self);
        }
        
        var _prune = ((not __samePriorityInterrupt) && _samePriorityInterrupt);
        
        __duckedGain            = _duckedGain;
        __rateOfChange          = _rateOfChange;
        __samePriorityInterrupt = _samePriorityInterrupt;
        
        if (_prune)
        {
            //Fade out older (lower indexed) voices if newer (higher indexed) voices have the same priority
            
            var _priorityArray = __priorityArray;
            var _voiceArray    = __voiceArray;
            
            var _i = array_length(_voiceArray)-1;
            repeat(array_length(_voiceArray))
            {
                var _priority = _priorityArray[_i];
                if (ds_map_exists(_priorityMap, _priority))
                {
                    _voiceArray[_i].__FadeOut(__rateOfChange, false);
                    
                    array_delete(_voiceArray,    _i, 1);
                    array_delete(_priorityArray, _i, 1);
                }
                else
                {
                    _priorityMap[? _priority] = true;
                }
                
                --_i;
            }
            
            //Manage memory!
            ds_map_clear(_priorityMap);
        }
    }
    
    static __ClearSetup = function()
    {
        __UpdateSetup(0, __VINYL_DEFAULT_DUCK_RATE_OF_GAIN, true);
    }
    
    static __Push = function(_voiceStruct, _priority, _doDuck)
    {
        var _priorityArray = __priorityArray;
        var _voiceArray    = __voiceArray;
        
        if (__samePriorityInterrupt)
        {
            //Voices with the same priorities interrupt each other
            
            if (_priority < __maxPriority)
            {
                if (_doDuck) _voiceStruct.__Duck(__duckedGain, __rateOfChange);
                
                //Try to find an existing voice to replace
                var _index = array_get_index(_priorityArray, _priority);
                if (_index >= 0)
                {
                    //We found an existing voice with the same priority - fade out the existing voice and replace with ourselves
                    _voiceArray[_i].__FadeOut(__rateOfChange, false);
                    _voiceArray[_i] = _voiceStruct;
                }
                else
                {
                    //If no voice exists to replace, add the incoming voice
                    array_push(_voiceArray, _voiceStruct);
                    array_push(_priorityArray, _priority);
                }
            }
            else //priority >= maxPriority
            {
                __maxPriority = _priority;
                
                if (_doDuck) _voiceStruct.__Duck(1, __rateOfChange);
                
                var _i = 0;
                repeat(array_length(_priorityArray))
                {
                    var _existingPriority = _priorityArray[_i];
                    if (_existingPriority < _priority)
                    {
                        //We found an existing voice with a lower priority - duck the existing voice
                        _voiceArray[_i].__Duck(__duckedGain, __rateOfChange);
                    }
                    else if (_existingPriority == _priority)
                    {
                        //We found an existing voice with the same priority - fade out the existing voice and replace with ourselves
                        _voiceArray[_i].__FadeOut(__rateOfChange, false);
                        _voiceArray[_i] = _voiceStruct;
                    }
                    
                    ++_i;
                }
                
                //If no voice exists to replace, add the incoming voice
                array_push(_voiceArray, _voiceStruct);
                array_push(_priorityArray, _priority);
            }
        }
        else
        {
            //Voices with the same priorities can stack up
            
            if (_priority < __maxPriority)
            {
                if (_doDuck) _voiceStruct.__Duck(__duckedGain, __rateOfChange);
            }
            else if (_priority > __maxPriority)
            {
                __maxPriority = _priority;
                
                if (_doDuck) _voiceStruct.__Duck(1, __rateOfChange);
                
                var _i = 0;
                repeat(array_length(_priorityArray))
                {
                    var _existingPriority = _priorityArray[_i];
                    if (_existingPriority < _priority)
                    {
                        //We found an existing voice with a lower priority - duck the existing voice
                        _voiceArray[_i].__Duck(__duckedGain, __rateOfChange);
                    }
                    
                    ++_i;
                }
            }
            
            array_push(_voiceArray, _voiceStruct);
            array_push(_priorityArray, _priority);
        }
    }
    
    static __Remove = function(_voiceStruct)
    {
        var _index = array_get_index(__voiceArray, _voiceStruct);
        if (_index >= 0)
        {
            array_delete(__voiceArray,    _index, 1);
            array_delete(__priorityArray, _index, 1);
            __Refresh();
        }
    }
    
    static __Get = function(_priority)
    {
        var _index = array_get_index(__priorityArray, _priority);
        return (_index < 0)? undefined : __voiceArray[_index].__voiceReference;
    }
    
    static __Update = function()
    {
        var _priorityArray = __priorityArray;
        var _voiceArray    = __voiceArray;
        
        var _refresh = false;
        
        //Remove any stopped voices
        var _i = array_length(_voiceArray)-1;
        repeat(array_length(_voiceArray))
        {
            if (not _voiceArray[_i].__IsPlaying())
            {
                if (_priorityArray[_i] >= __maxPriority) _refresh = true;
                array_delete(_voiceArray,    _i, 1);
                array_delete(_priorityArray, _i, 1);
            }
            
            --_i;
        }
        
        //Only refresh if we have to because it's quite expensive
        if (_refresh) __Refresh();
    }
    
    static __Refresh = function()
    {
        var _priorityArray = __priorityArray;
        var _voiceArray    = __voiceArray;
        
        //To find the voice with the highest priority we must first start at infinity
        __maxPriority = -infinity;
        
        if (__samePriorityInterrupt)
        {
            var _maxVoice = undefined;
            var _i = 0;
            repeat(array_length(_voiceArray))
            {
                var _priority = _priorityArray[_i];
                if (_priority > __maxPriority)
                {
                    __maxPriority = _priority;
                    _maxVoice = _voiceArray[_i];
                }
                
                ++_i;
            }
            
            //Activate whatever voice is now the highest priority
            if (_maxVoice != undefined)
            {
                _maxVoice.__Duck(1, __rateOfChange);
            }
        }
        else
        {
            //Find the maximum priority
            var _i = 0;
            repeat(array_length(_voiceArray))
            {
                __maxPriority = max(__maxPriority, _priorityArray[_i]);
                ++_i;
            }
            
            //And then set duck values for the highest priority voices
            var _i = 0;
            repeat(array_length(_voiceArray))
            {
                if (_priorityArray[_i] >= __maxPriority)
                {
                    _voiceArray[_i].__Duck(1, __rateOfChange);
                }
                
                ++_i;
            }
        }
    }
    
    static __ExportJSON = function()
    {
        var _struct = {
            ducker: __duckerName,
        };
        
        if (__duckedGain != 0) _struct.duckedGain = __duckedGain;
        if (__rateOfChange != __VINYL_DEFAULT_DUCK_RATE_OF_GAIN) _struct.rateOfChange = __rateOfChange;
        if (not __samePriorityInterrupt) _struct.samePriorityInterrupt = __samePriorityInterrupt;
        
        return _struct;
    }
    
    static __ExportGML = function(_buffer, _indent)
    {
        buffer_write(_buffer, buffer_text, _indent);
        buffer_write(_buffer, buffer_text, "{\n");
        buffer_write(_buffer, buffer_text, _indent);
        buffer_write(_buffer, buffer_text, "    ducker: \"");
        buffer_write(_buffer, buffer_text, __duckerName);
        buffer_write(_buffer, buffer_text, "\",\n");
        
        if (__duckedGain != 1)
        {
            buffer_write(_buffer, buffer_text, _indent);
            buffer_write(_buffer, buffer_text, "    duckedGain: ");
            buffer_write(_buffer, buffer_text, __duckedGain);
            buffer_write(_buffer, buffer_text, ",\n");
        }
        
        if (__rateOfChange != __VINYL_DEFAULT_DUCK_RATE_OF_GAIN)
        {
            buffer_write(_buffer, buffer_text, _indent);
            buffer_write(_buffer, buffer_text, "    rateOfChange: ");
            buffer_write(_buffer, buffer_text, __rateOfChange);
            buffer_write(_buffer, buffer_text, ",\n");
        }
        
        if (not __samePriorityInterrupt)
        {
            buffer_write(_buffer, buffer_text, _indent);
            buffer_write(_buffer, buffer_text, "    samePriorityInterrupt: ");
            buffer_write(_buffer, buffer_text, __samePriorityInterrupt);
            buffer_write(_buffer, buffer_text, ",\n");
        }
        
        buffer_write(_buffer, buffer_text, _indent);
        buffer_write(_buffer, buffer_text, "},\n");
    }
}

function __VinylImportDuckerJSON(_json)
{
    if (VINYL_SAFE_JSON_IMPORT)
    {
        var _variableNames = struct_get_names(_json);
        var _i = 0;
        repeat(array_length(_variableNames))
        {
            switch(_variableNames[_i])
            {
                case "ducker":
                case "duckedGain":
                case "rateOfChange":
                case "samePriorityInterrupt":
                break;
                
                default:
                    __VinylError("Ducker \"", _json, "\" property .", _variableNames[_i], " not supported");
                break;
            }
            
            ++_i;
        }
    }
    
    VinylSetupDucker(_json.ducker, _json[$ "duckedGain"], _json[$ "rateOfChange"], _json[$ "samePriorityInterrupt"]);
    
    return _json.ducker;
}