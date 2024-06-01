// Feather disable all

/// @param patternName
/// @param soundArray
/// @param gainMin
/// @param gainMax
/// @param pitchMin
/// @param pitchMax
/// @param loop
/// @param mix
/// @param ducker
/// @param duckPriority
/// @param metadata

function __VinylClassPatternShuffle(_patternName, _soundArray, _gainMin, _gainMax, _pitchMin, _pitchMax, _loop, _mixName, _duckerName, _duckPrio, _metadata) constructor
{
    static _mixDict         = __VinylSystem().__mixDict;
    static _toUpdateArray   = __VinylSystem().__toUpdateArray;
    static _voiceToSoundMap = __VinylSystem().__voiceToSoundMap;
    
    __patternName = _patternName;
    
    //Support use of wildcards
    if (is_string(_soundArray) && (string_pos("*", _soundArray) > 0))
    {
        __soundArrayRaw = _soundArray;
        __soundArray    =  __VinylFindMatchingAudioAssets(_soundArray);
    }
    else
    {
        __soundArrayRaw = undefined;
        __soundArray    = __VinylImportSoundArray(_soundArray);
    }
    
    __gainMin    = _gainMin;
    __gainMax    = _gainMax;
    __pitchMin   = _pitchMin;
    __pitchMax   = _pitchMax;
    __loop       = _loop;
    __mixName    = _mixName;
    __duckerName = _duckerName;
    __duckPrio   = _duckPrio;
    __metadata   = _metadata;
    
    __gainRandomize  = (_gainMin != _gainMax);
    __pitchRandomize = (_pitchMin != _pitchMax);
    
    __soundCount = array_length(__soundArray);
    __playIndex  = infinity;
    
    if (__VINYL_RUNNING_FROM_IDE && (__soundCount <= 0))
    {
        __VinylWarning("Shuffle pattern \"", _patternName, "\" has no sounds");
    }
    
    
    
    
    
    static __Play = function(_loopLocal, _gainLocal, _pitchLocal, _duckerNameLocal, _duckPrioLocal)
    {
        if (__soundCount < 1)
        {
            return undefined;
        }
        else if (__soundCount == 1)
        {
            var _sound = __soundArray[0];
        }
        else
        {
            if (__playIndex >= __soundCount) //If we've played through our bank of sounds, reshuffle
            {
                __playIndex = 0;
                var _last = __soundArray[__soundCount-1];
                array_delete(__soundArray, __soundCount-1, 1); //Make sure we don't reshuffle in the last played sound...
                __VinylArrayShuffle(__soundArray);
                array_insert(__soundArray, __soundCount div 2, _last); //...and stick it somewhere in the middle instead
            }
            
            var _sound = __soundArray[__playIndex];
            ++__playIndex;
        }
        
        var _gainSound = __VinylSoundGetGain(_sound);
        
        if (__gainRandomize)
        {
            var _gainFactor  = __VinylRandom(1);
            var _gainPattern = lerp(__gainMin,  __gainMax,  _gainFactor);
        }
        else
        {
            var _gainFactor  = 0.5;
            var _gainPattern = __gainMin;
        }
        
        if (__pitchRandomize)
        {
            var _pitchFactor  = __VinylRandom(1);
            var _pitchPattern = lerp(__pitchMin, __pitchMax, _pitchFactor);
        }
        else
        {
            var _pitchFactor  = 0.5;
            var _pitchPattern = __pitchMin;
        }
        
        if (__mixName == undefined)
        {
            var _mixStruct       = undefined;
            var _gainMix         = 1;
            var _loopFinal       = _loopLocal ?? __loop;
            var _duckerNameFinal = _duckerNameLocal ?? __duckerName;
        }
        else
        {
            var _mixStruct = _mixDict[$ __mixName];
            if (_mixStruct == undefined)
            {
                __VinylError("Mix \"", __mixName, "\" not recognised");
                return;
            }
            
            var _gainMix         = _mixStruct.__gainFinal;
            var _loopFinal       = _loopLocal ?? (__loop ?? (_mixStruct.__membersLoop ?? false));
            var _duckerNameFinal = _duckerNameLocal ?? (__duckerName ?? _mixStruct.__membersDuckOn);
        }
            
        if (_duckerNameFinal != undefined)
        {
            var _duckerStruct = _duckerDict[$ _duckerNameFinal];
            if (_duckerStruct == undefined)
            {
                __VinylError("Ducker \"", _duckerNameFinal, "\" not recognised");
                return;
            }
            
            var _duckPrioFinal = _duckPrioLocal ?? (__duckPrio ?? 0);
            var _gainDuck      = (_duckerStruct.__maxPriority <= _duckPrioFinal)? 1 : _duckerStruct.__duckedGain;
        }
        else
        {
            var _duckerStruct = undefined;
            var _gainDuck     = 1;
        }
        
        var _voice = audio_play_sound(_sound, 0, _loopFinal, _gainSound*_gainPattern*_gainLocal*_gainMix*_gainDuck/VINYL_MAX_VOICE_GAIN, 0, _pitchPattern*_pitchLocal);
        
        //If we're in live edit mode then always create a struct representation
        if (VINYL_LIVE_EDIT || (_duckerNameFinal != undefined))
        {
            var _voiceStruct = new __VinylClassVoiceShuffle(_sound, _voice, _loopLocal, _gainPattern, _gainLocal, _gainMix, _gainDuck, _pitchPattern, _pitchLocal, _duckerNameLocal, _duckPrioLocal, self, _gainFactor, _pitchFactor);
        }
        
        if (_duckerStruct != undefined) _duckerStruct.__Push(_voiceStruct, _duckPrioFinal, false);
        if (_mixStruct    != undefined) _mixStruct.__Add(_voice);
        
        _voiceToSoundMap[? _voice] = _sound;
        
        return _voice;
    }
    
    static __UpdateSetup = function(_soundArray, _gainMin, _gainMax, _pitchMin, _pitchMax, _loop, _mixName, _duckerName, _duckPrio, _metadata)
    {
        if (VINYL_LIVE_EDIT)
        {
            array_push(_toUpdateArray, self);
        }
        
        //Support use of wildcards
        if (is_string(_soundArray) && (string_pos("*", _soundArray) > 0))
        {
            __soundArrayRaw = _soundArray;
            __soundArray    =  __VinylFindMatchingAudioAssets(_soundArray);
        }
        else
        {
            __soundArrayRaw = undefined;
            __soundArray    = __VinylImportSoundArray(_soundArray);
        }
        
        __gainMin    = _gainMin;
        __gainMax    = _gainMax;
        __pitchMin   = _pitchMin;
        __pitchMax   = _pitchMax;
        __loop       = _loop;
        __mixName    = _mixName;
        __duckerName = _duckerName;
        __duckPrio   = _duckPrio;
        __metadata   = _metadata;
        
        __gainRandomize  = (_gainMin != _gainMax);
        __pitchRandomize = (_pitchMin != _pitchMax);
        
        __soundCount = array_length(__soundArray);
        __playIndex  = infinity;
        
        if (__VINYL_RUNNING_FROM_IDE && (__soundCount <= 0))
        {
            __VinylWarning("Shuffle pattern \"", __patternName, "\" has no sounds");
        }
    }
    
    static __ClearSetup = function()
    {
        __UpdateSetup(__soundArray, 1, 1, 1, 1, (VINYL_DEFAULT_MIX == VINYL_NO_MIX)? undefined : VINYL_DEFAULT_MIX, undefined, 0, undefined);
    }
    
    static __ExportJSON = function()
    {
        if (__soundArrayRaw != undefined) //Handle wildcard strings
        {
            _soundArray = __soundArrayRaw;
        }
        else
        {
            var _soundArray = [];
            var _i = 0;
            repeat(array_length(__soundArray))
            {
                array_push(_soundArray, audio_get_name(__soundArray[_i]));
                ++_i;
            }
        }
        
        var _struct = {
            shuffle: __patternName,
            sounds: _soundArray,
        };
        
        if ((__gainMin != 1) || (__gainMax != 1))
        {
            if (__gainMin == __gainMax)
            {
                _struct.gain = __gainMin;
            }
            else
            {
                _struct.gain = [__gainMin, __gainMax];
            }
        }
        
        if ((__pitchMin != 1) || (__pitchMax != 1))
        {
            if (__pitchMin == __pitchMax)
            {
                _struct.pitch = __pitchMin;
            }
            else
            {
                _struct.pitch = [__pitchMin, __pitchMax];
            }
        }
        
        //TODO - Write ducker and ducker priority
        
        return _struct;
    }
    
    static __ExportGML = function(_buffer, _indent, _useMacros)
    {
        buffer_write(_buffer, buffer_text, _indent);
        buffer_write(_buffer, buffer_text, "{\n");
        
        buffer_write(_buffer, buffer_text, _indent);
        buffer_write(_buffer, buffer_text, "    shuffle: ");
        
        if (_useMacros)
        {
            buffer_write(_buffer, buffer_text, __VinylGetPatternMacro(__patternName));
            buffer_write(_buffer, buffer_text, ",\n");
        }
        else
        {
            buffer_write(_buffer, buffer_text, "\"");
            buffer_write(_buffer, buffer_text, __patternName);
            buffer_write(_buffer, buffer_text, "\",\n");
        }
        
        buffer_write(_buffer, buffer_text, _indent);
        buffer_write(_buffer, buffer_text, "    sounds: ");
        
        if (__soundArrayRaw != undefined) //Handle wildcard strings
        {
            buffer_write(_buffer, buffer_text, "\"");
            buffer_write(_buffer, buffer_text, __soundArrayRaw);
            buffer_write(_buffer, buffer_text, "\",\n");
        }
        else
        {
            buffer_write(_buffer, buffer_text, "[");
            
            var _i = 0;
            repeat(array_length(__soundArray))
            {
                buffer_write(_buffer, buffer_text, audio_get_name(__soundArray[_i]));
                buffer_write(_buffer, buffer_text, ", ");
                ++_i;
            }
            
            if (_i > 0) buffer_seek(_buffer, buffer_seek_relative, -2);
            
            buffer_write(_buffer, buffer_text, "],\n");
        }
        
        if ((__gainMin != 1) || (__gainMax != 1))
        {
            if (__gainMin == __gainMax)
            {
                buffer_write(_buffer, buffer_text, _indent);
                buffer_write(_buffer, buffer_text, "    gain: ");
                buffer_write(_buffer, buffer_text, __gainMin);
                buffer_write(_buffer, buffer_text, ",\n");
            }
            else
            {
                buffer_write(_buffer, buffer_text, _indent);
                buffer_write(_buffer, buffer_text, "    gain: [");
                buffer_write(_buffer, buffer_text, __gainMin);
                buffer_write(_buffer, buffer_text, ", ");
                buffer_write(_buffer, buffer_text, __gainMax);
                buffer_write(_buffer, buffer_text, "],\n");
            }
        }
        
        if ((__pitchMin != 1) || (__pitchMax != 1))
        {
            if (__pitchMin == __pitchMax)
            {
                buffer_write(_buffer, buffer_text, _indent);
                buffer_write(_buffer, buffer_text, "    pitch: ");
                buffer_write(_buffer, buffer_text, __pitchMin);
                buffer_write(_buffer, buffer_text, ",\n");
            }
            else
            {
                buffer_write(_buffer, buffer_text, _indent);
                buffer_write(_buffer, buffer_text, "    pitch: [");
                buffer_write(_buffer, buffer_text, __pitchMin);
                buffer_write(_buffer, buffer_text, ", ");
                buffer_write(_buffer, buffer_text, __pitchMax);
                buffer_write(_buffer, buffer_text, "],\n");
            }
        }
        
        //TODO - Write ducker and ducker priority
        
        buffer_write(_buffer, buffer_text, _indent);
        buffer_write(_buffer, buffer_text, "},\n");
    }
}

function __VinylImportShuffleJSON(_json)
{
    if (VINYL_SAFE_JSON_IMPORT)
    {
        var _variableNames = struct_get_names(_json);
        var _i = 0;
        repeat(array_length(_variableNames))
        {
            switch(_variableNames[_i])
            {
                case "shuffle":
                case "sound":
                case "sounds":
                case "gain":
                case "pitch":
                case "loop":
                case "duckOn":
                case "duckPrio":
                case "metadata":
                break;
                
                default:
                    __VinylError("Shuffle pattern property .", _variableNames[_i], " not supported");
                break;
            }
            
            ++_i;
        }
        
        if ((not struct_exists(_json, "sound")) && (not struct_exists(_json, "sounds")))
        {
            __VinylError("Shuffle pattern \"", _json.shuffle, "\" property .sounds must be defined");
        }
    }
    
    var _sounds = _json[$ "sounds"] ?? _json[$ "sound"];
    VinylSetupShuffle(_json.shuffle, _sounds, _json[$ "gain"], _json[$ "pitch"], _json[$ "loop"], undefined, _json[$ "duckOn"], _json[$ "duckPrio"], _json[$ "metadata"]);
    
    return _json.shuffle;
}