// Feather disable all

/// @param patternName
/// @param soundHead
/// @param soundLoop
/// @param soundTail
/// @param gain
/// @param mix
/// @param ducker
/// @param duckPriority
/// @param emitterAlias
/// @param metadata

function __VinylClassPatternHLT(_patternName, _soundHead, _soundLoop, _soundTail, _gain, _mixName, _duckerName, _duckPrio, _emitterAlias, _metadata) constructor
{
    static _voiceUpdateArray = __VinylSystem().__voiceUpdateArray;
    static _emitterMap       = __VinylSystem().__emitterMap;
    static _toUpdateArray    = __VinylSystem().__toUpdateArray;
    
    __patternName = _patternName;
    
    __soundHead    = __VinylImportSound(_soundHead);
    __soundLoop    = __VinylImportSound(_soundLoop);
    __soundTail    = __VinylImportSound(_soundTail);
    __gain         = _gain;
    __mixName      = _mixName;
    __duckerName   = _duckerName;
    __duckPrio     = _duckPrio;
    __emitterAlias = _emitterAlias;
    __metadata     = _metadata;
    
    
    
    
    
    static __Play = function(_emitter, _loopLocal__UNUSED, _gainLocal, _pitchLocal, _duckerNameLocal, _duckPrioLocal)
    {
        return (new __VinylClassVoiceHLT(_emitter, self, _gainLocal, _pitchLocal, _duckerNameLocal, _duckPrioLocal)).__voiceReference;
    }
    
    static __UpdateSetup = function(_soundHead, _soundLoop, _soundTail, _gain, _mixName, _duckerName, _duckPrio, _emitterAlias, _metadata)
    {
        var _newSoundHead = __VinylImportSound(_soundHead);
        var _newSoundLoop = __VinylImportSound(_soundLoop);
        var _newSoundTail = __VinylImportSound(_soundTail);
        
        if (VINYL_LIVE_EDIT)
        {
            __changedHead = (__soundHead != _newSoundHead);
            __changedLoop = (__soundLoop != _newSoundLoop);
            __changedTail = (__soundTail != _newSoundTail);
            
            array_push(_toUpdateArray, self);
        }
        
        __soundHead    = _newSoundHead;
        __soundLoop    = _newSoundLoop;
        __soundTail    = _newSoundTail;
        __gain         = _gain;
        __mixName      = _mixName;
        __duckerName   = _duckerName;
        __duckPrio     = _duckPrio;
        __emitterAlias = _emitterAlias;
        __metadata     = _metadata;
    }
    
    static __ClearSetup = function()
    {
        __UpdateSetup(__soundHead, __soundLoop, __soundTail, 1, (VINYL_DEFAULT_MIX == VINYL_NO_MIX)? undefined : VINYL_DEFAULT_MIX, undefined, 0, undefined);
    }
    
    static __UsesSound = function(_sound)
    {
        return ((__soundHead == _sound) || (__soundLoop = _sound) || (__soundTail == _sound));
    }
    
    static __ExportJSON = function()
    {
        var _struct = {
            hlt: __patternName,
        };
        
        if (__soundHead != undefined) _struct.head = audio_get_name(__soundHead);
        if (__soundLoop != undefined) _struct.loop = audio_get_name(__soundLoop);
        if (__soundTail != undefined) _struct.tail = audio_get_name(__soundTail);
        
        if (__gain != 1) _struct.gain = __gain;
        if (__duckerName != undefined) _struct.duckOn = __duckerName;
        if (__duckPrio != 0) _struct.duckPrio = __duckPrio;
        if (__emitterAlias != undefined) _struct.emitter = __emitterAlias;
        
        return _struct;
    }
    
    static __ExportGML = function(_buffer, _indent, _useMacros)
    {
        buffer_write(_buffer, buffer_text, _indent);
        buffer_write(_buffer, buffer_text, "{\n");
        
        buffer_write(_buffer, buffer_text, _indent);
        buffer_write(_buffer, buffer_text, "    hlt: ");
        
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
        
        if (__soundHead != undefined)
        {
            buffer_write(_buffer, buffer_text, _indent);
            buffer_write(_buffer, buffer_text, "    head: ");
            buffer_write(_buffer, buffer_text, audio_get_name(__soundHead));
            buffer_write(_buffer, buffer_text, ",\n");
        }
        
        if (__soundLoop != undefined)
        {
            buffer_write(_buffer, buffer_text, _indent);
            buffer_write(_buffer, buffer_text, "    loop: ");
            buffer_write(_buffer, buffer_text, audio_get_name(__soundLoop));
            buffer_write(_buffer, buffer_text, ",\n");
        }
        
        if (__soundTail != undefined)
        {
            buffer_write(_buffer, buffer_text, _indent);
            buffer_write(_buffer, buffer_text, "    tail: ");
            buffer_write(_buffer, buffer_text, audio_get_name(__soundTail));
            buffer_write(_buffer, buffer_text, ",\n");
        }
        
        if (__gain != 1)
        {
            buffer_write(_buffer, buffer_text, _indent);
            buffer_write(_buffer, buffer_text, "    gain: ");
            buffer_write(_buffer, buffer_text, __gain);
            buffer_write(_buffer, buffer_text, ",\n");
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

function __VinylImportHLTJSON(_json)
{
    if (VINYL_SAFE_JSON_IMPORT)
    {
        var _variableNames = struct_get_names(_json);
        var _i = 0;
        repeat(array_length(_variableNames))
        {
            switch(_variableNames[_i])
            {
                case "hlt":
                case "head":
                case "loop":
                case "tail":
                case "gain":
                case "duckOn":
                case "duckPrio":
                case "emitter":
                case "metadata":
                break;
                
                default:
                    __VinylError("Head-Loop-Tail pattern property .", _variableNames[_i], " not supported");
                break;
            }
            
            ++_i;
        }
        
        if (not struct_exists(_json, "loop")) __VinylError("Head-Loop-Tail pattern \"", _json.hlt, "\" property .loop must be defined");
    }
    
    VinylSetupHLT(_json.hlt, _json[$ "head"], _json.loop, _json[$ "tail"], _json[$ "gain"], undefined, _json[$ "duckOn"], _json[$ "duckPrio"], _json[$ "emitter"], _json[$ "metadata"]);
    
    return _json.hlt;
}