// Feather disable all

/// @param patternName
/// @param soundArray
/// @param loop
/// @param gain
/// @param animCurve
/// @param mix
/// @param ducker
/// @param duckPriority
/// @param metadata

function __VinylClassPatternBlend(_patternName, _soundArray, _loop, _gain, _animCurve, _mixName, _duckerName, _duckPrio, _metadata) constructor
{
    static _soundDict     = __VinylSystem().__soundDict;
    static _toUpdateArray = __VinylSystem().__toUpdateArray;
    
    
    __patternName = _patternName;
    
    __soundArray = __VinylImportSoundArray(_soundArray);
    __loop       = _loop;
    __gain       = _gain;
    __animCurve  = __VinylImportAnimCurve(_animCurve);
    __mixName    = _mixName;
    __duckerName = _duckerName;
    __duckPrio   = _duckPrio;
    __metadata   = _metadata;
        
    if (__VINYL_RUNNING_FROM_IDE && (array_length(_soundArray) <= 0))
    {
        __VinylWarning("Shuffle pattern \"", __patternName, "\" has no sounds");
    }
    
    
    
    
    
    static __Play = function(_loopLocal, _gainLocal, _pitchLocal, _duckerNameLocal, _duckPrioLocal)
    {
        return (new __VinylClassVoiceBlend(self, _loopLocal, _gainLocal, _pitchLocal, _duckerNameLocal, _duckPrioLocal, __mixName)).__voiceReference;
    }
    
    static __UpdateSetup = function(_soundArray, _loop, _gain, _animCurve, _mixName, _duckerName, _duckPrio, _metadata)
    {
        if (VINYL_LIVE_EDIT)
        {
            __changedSoundArray = (not array_equals(__soundArray, _soundArray));
            array_push(_toUpdateArray, self);
        }
        
        __soundArray = __VinylImportSoundArray(_soundArray);
        __loop       = _loop;
        __gain       = _gain;
        __animCurve  = __VinylImportAnimCurve(_animCurve);
        __mixName    = _mixName;
        __duckerName = _duckerName;
        __duckPrio   = _duckPrio;
        __metadata   = _metadata;
        
        if (__VINYL_RUNNING_FROM_IDE && (array_length(__soundArray) <= 0))
        {
            __VinylWarning("Shuffle pattern \"", __patternName, "\" has no sounds");
        }
    }
    
    static __ClearSetup = function()
    {
        __UpdateSetup(__soundArray, false, 1, (VINYL_DEFAULT_MIX == VINYL_NO_MIX)? undefined : VINYL_DEFAULT_MIX, undefined, 0, undefined);
    }
    
    static __UsesSound = function(_sound)
    {
        return array_contains(__soundArray, _sound);
    }
    
    static __ExportJSON = function()
    {
        var _soundArray = [];
        var _i = 0;
        repeat(array_length(__soundArray))
        {
            array_push(_soundArray, audio_get_name(__soundArray[_i]));
            ++_i;
        }
        
        var _struct = {
            blend: __patternName,
            sounds: _soundArray,
        };
        
        if (not __loop) _struct.loop = false;
        if (__gain != 1) _struct.gain = __gain;
        if (__animCurve != undefined) _struct.animCurve = animcurve_get(__animCurve).name;
        
        //TODO - Write ducker and ducker priority
        
        return _struct;
    }
    
    static __ExportGML = function(_buffer, _indent, _useMacros)
    {
        buffer_write(_buffer, buffer_text, _indent);
        buffer_write(_buffer, buffer_text, "{\n");
        
        buffer_write(_buffer, buffer_text, _indent);
        buffer_write(_buffer, buffer_text, "    blend: ");
        
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
        buffer_write(_buffer, buffer_text, "    sounds: [");
        
        if (array_length(__soundArray) > 0)
        {
            var _i = 0;
            repeat(array_length(__soundArray))
            {
                buffer_write(_buffer, buffer_text, audio_get_name(__soundArray[_i]));
                buffer_write(_buffer, buffer_text, ", ");
                ++_i;
            }
            
            buffer_seek(_buffer, buffer_seek_relative, -2);
        }
        
        buffer_write(_buffer, buffer_text, "],\n");
        
        if (not __loop)
        {
            buffer_write(_buffer, buffer_text, _indent);
            buffer_write(_buffer, buffer_text, "    loop: false,\n");
        }
        
        if (__gain != 1)
        {
            buffer_write(_buffer, buffer_text, _indent);
            buffer_write(_buffer, buffer_text, "    gain: ");
            buffer_write(_buffer, buffer_text, __gain);
            buffer_write(_buffer, buffer_text, ",\n");
        }
        
        //TODO - Write ducker and ducker priority
        
        buffer_write(_buffer, buffer_text, _indent);
        buffer_write(_buffer, buffer_text, "},\n");
    }
}

function __VinylImportBlendJSON(_json)
{
    if (VINYL_SAFE_JSON_IMPORT)
    {
        var _variableNames = struct_get_names(_json);
        var _i = 0;
        repeat(array_length(_variableNames))
        {
            switch(_variableNames[_i])
            {
                case "blend":
                case "loop":
                case "sounds":
                case "gain":
                case "duckOn":
                case "duckPrio":
                case "animCurve":
                case "metadata":
                break;
                
                default:
                    __VinylError("Blend pattern property \"", _variableNames[_i], "\" not supported");
                break;
            }
            
            ++_i;
        }
        
        if (not struct_exists(_json, "sounds")) __VinylError("Blend pattern \"", _json.blend, "\" property .sounds must be defined");
    }
    
    VinylSetupBlend(_json.blend, _json.sounds, _json[$ "loop"], _json[$ "gain"], _json[$ "animCurve"], undefined, _json[$ "duckOn"], _json[$ "duckPrio"], _json[$ "metadata"]);
    
    return _json.blend;
}