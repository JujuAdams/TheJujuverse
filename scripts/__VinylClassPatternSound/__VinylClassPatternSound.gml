// Feather disable all

/// @param sound
/// @param gain
/// @param pitch
/// @param loop
/// @param mix
/// @param ducker
/// @param duckPriority
/// @param emitterAlias
/// @param metadata

function __VinylClassPatternSound(_sound, _gain, _pitch, _loop, _mixName, _duckerName, _duckPrio, _emitterAlias, _metadata) constructor
{
    static _mixDict       = __VinylSystem().__mixDict;
    static _duckerDict    = __VinylSystem().__duckerDict;
    static _emitterMap    = __VinylSystem().__emitterMap;
    static _toUpdateArray = __VinylSystem().__toUpdateArray;
    
    __sound        = _sound;
    __gain         = _gain;
    __pitch        = _pitch;
    __loop         = _loop;
    __mixName      = _mixName;
    __duckerName   = _duckerName;
    __duckPrio     = _duckPrio;
    __emitterAlias = _emitterAlias;
    __metadata     = _metadata;
    
    
    
    
    
    static __Play = function(_emitter, _loopLocal, _gainLocal, _pitchLocal, _duckerNameLocal, _duckPrioLocal)
    {
        var _sound      = __sound;
        var _gainSound  = __gain;
        var _pitchSound = __pitch;
        var _mixName    = __mixName;
        
        if (__mixName == undefined)
        {
            var _mixStruct       = undefined;
            var _gainMix         = 1;
            var _pitchMix        = 1;
            var _loopFinal       = _loopLocal ?? __loop;
            var _duckerNameFinal = _duckerNameLocal ?? __duckerName;
            
            if (_emitter == undefined)
            {
                _emitter = _emitterMap[? __emitterAlias];
            }
        }
        else
        {
            var _mixStruct = _mixDict[$ _mixName];
            if (_mixStruct == undefined)
            {
                __VinylError("Mix \"", _mixName, "\" not recognised");
                return;
            }
            
            var _gainMix         = _mixStruct.__gainFinal;
            var _pitchMix        = _mixStruct.__pitchLocal;
            var _loopFinal       = _loopLocal ?? (__loop ?? (_mixStruct.__membersLoop ?? false));
            var _duckerNameFinal = _duckerNameLocal ?? (__duckerName ?? _mixStruct.__membersDuckOn);
            
            if (_emitter == undefined)
            {
                _emitter = _emitterMap[? __emitterAlias ?? _mixStruct.__membersEmitterAlias];
            }
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
            var _gainDuck = (_duckerStruct.__maxPriority <= _duckPrioFinal)? 1 : _duckerStruct.__duckedGain;
        }
        else
        {
            var _duckerStruct = undefined;
            var _gainDuck   = 1;
        }
        
        if (_emitter == undefined)
        {
            var _voice = audio_play_sound(_sound, 0, _loopFinal, _gainSound*_gainLocal*_gainMix*_gainDuck/VINYL_MAX_VOICE_GAIN, 0, _pitchSound*_pitchLocal);
        }
        else
        {
            var _voice = audio_play_sound_on(_emitter, _sound, _loopFinal, 0, _gainSound*_gainLocal*_gainMix*_gainDuck/VINYL_MAX_VOICE_GAIN, 0, _pitchSound*_pitchLocal);
        }
        
        //If we're in live edit mode then always create a struct representation
        if (VINYL_LIVE_EDIT || (_duckerNameFinal != undefined))
        {
            var _voiceStruct = new __VinylClassVoiceSound(_voice, _loopLocal,
                                                          _gainSound, _gainLocal, _gainMix, _gainDuck,
                                                          _pitchSound, _pitchLocal, _pitchMix,
                                                          _duckerNameFinal, _duckerNameLocal, _duckPrioLocal,
                                                          self);
        }
        
        if (_duckerStruct != undefined) _duckerStruct.__Push(_voiceStruct, _duckPrioFinal, false);
        if (_mixStruct != undefined) _mixStruct.__Add(_voice);
        
        return _voice;
    }
    
    static __UpdateSetup = function(_gain, _pitch, _loop, _mixName, _duckerName, _duckPrio, _emitterAlias, _metadata)
    {
        if (VINYL_LIVE_EDIT)
        {
            array_push(_toUpdateArray, self);
        }
        
        __gain         = _gain;
        __pitch        = _pitch;
        __loop         = _loop;
        __mixName      = _mixName;
        __duckerName   = _duckerName;
        __duckPrio     = _duckPrio;
        __emitterAlias = _emitterAlias;
        __metadata     = _metadata;
    }
    
    static __ClearSetup = function()
    {
        __UpdateSetup(1, 1, false, (VINYL_DEFAULT_MIX == VINYL_NO_MIX)? undefined : VINYL_DEFAULT_MIX, undefined, 0, undefined);
    }
    
    static __ExportJSON = function(_ignoreEmpty)
    {
        if (_ignoreEmpty)
        {
            if ((__gain == 1) && (__pitch == 1) && (not __loop))
            {
                return undefined;
            }
        }
        
        var _struct = {
            sound: audio_get_name(__sound),
        };
        
        if (__gain != 1) _struct.gain = __gain;
        if (__pitch != 1) _struct.pitch = __pitch;
        if (__loop) _struct.loop = true;
        if (__duckerName != undefined) _struct.duckOn = __duckerName;
        if (__duckPrio != 0) _struct.duckPrio = __duckPrio;
        if (__emitterAlias != undefined) _struct.emitter = __emitterAlias;
        
        return _struct;
    }
    
    static __ExportGML = function(_buffer, _indent, _ignoreEmpty)
    {
        if (_ignoreEmpty)
        {
            if ((__gain == 1) && (__pitch == 1) && (not __loop))
            {
                return undefined;
            }
        }
        
        buffer_write(_buffer, buffer_text, _indent);
        buffer_write(_buffer, buffer_text, "{\n");
        buffer_write(_buffer, buffer_text, _indent);
        buffer_write(_buffer, buffer_text, "    sound: ");
        buffer_write(_buffer, buffer_text, audio_get_name(__sound));
        buffer_write(_buffer, buffer_text, ",\n");
        
        if (__gain != 1)
        {
            buffer_write(_buffer, buffer_text, _indent);
            buffer_write(_buffer, buffer_text, "    gain: ");
            buffer_write(_buffer, buffer_text, __gain);
            buffer_write(_buffer, buffer_text, ",\n");
        }
        
        if (__pitch != 1)
        {
            buffer_write(_buffer, buffer_text, _indent);
            buffer_write(_buffer, buffer_text, "    pitch: ");
            buffer_write(_buffer, buffer_text, __pitch);
            buffer_write(_buffer, buffer_text, ",\n");
        }
        
        if (__loop)
        {
            buffer_write(_buffer, buffer_text, _indent);
            buffer_write(_buffer, buffer_text, "    loop: true,\n");
        }
        
        if (__duckerName != undefined)
        {
            buffer_write(_buffer, buffer_text, _indent);
            buffer_write(_buffer, buffer_text, "    duckOn: \"");
            buffer_write(_buffer, buffer_text, __duckerName);
            buffer_write(_buffer, buffer_text, "\",\n");
        }
        
        if (__duckPrio != 0)
        {
            buffer_write(_buffer, buffer_text, _indent);
            buffer_write(_buffer, buffer_text, "    duckPrio: ");
            buffer_write(_buffer, buffer_text, string(__duckPrio));
            buffer_write(_buffer, buffer_text, ",\n");
        }
        
        if (__emitterAlias != undefined)
        {
            buffer_write(_buffer, buffer_text, _indent);
            buffer_write(_buffer, buffer_text, "    emitter: \"");
            buffer_write(_buffer, buffer_text, __emitterAlias);
            buffer_write(_buffer, buffer_text, "\",\n");
        }
        
        buffer_write(_buffer, buffer_text, _indent);
        buffer_write(_buffer, buffer_text, "},\n");
    }
}

function __VinylImportSoundJSON(_json)
{
    if (VINYL_SAFE_JSON_IMPORT)
    {
        var _variableNames = struct_get_names(_json);
        var _i = 0;
        repeat(array_length(_variableNames))
        {
            switch(_variableNames[_i])
            {
                case "sound":
                case "loop":
                case "gain":
                case "pitch":
                case "duckOn":
                case "duckPrio":
                case "emitter":
                case "metadata":
                break;
                
                default:
                    __VinylError("Sound \"", _json, "\" property .", _variableNames[_i], " not supported");
                break;
            }
            
            ++_i;
        }
    }
    
    var _sound = __VinylImportSound(_json.sound);
    VinylSetupSound(_sound, _json[$ "gain"], _json[$ "pitch"], _json[$ "loop"], undefined, _json[$ "duckOn"], _json[$ "duckPrio"], _json[$ "emitter"], _json[$ "metadata"]);
    return _sound;
}