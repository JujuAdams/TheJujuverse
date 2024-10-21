// Feather disable all

/// @param templateName
/// @param soundArray
/// @param behaviour
/// @param loopQueue
/// @param emitterAlias

function __VinylClassQueueTemplate(_queueTemplateName, _soundArray, _behaviour, _loopQueue, _emitterAlias = undefined) constructor
{
    static _system            = __VinylSystem();
    static _queueTemplateDict = _system.__queueTemplateDict;
    static _emitterMap        = _system.__emitterMap;
    static _toUpdateArray     = _system.__toUpdateArray;
    
    __templateName = _queueTemplateName;
    
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
    
    __behaviour    = _behaviour;
    __loopQueue    = _loopQueue;
    __emitterAlias = _emitterAlias;
    
    __prevBehaviour = undefined;
    __prevLoopQueue = undefined;
    
    if (__VINYL_RUNNING_FROM_IDE && (array_length(__soundArray) <= 0))
    {
        __VinylWarning("Queue template \"", _queueTemplateName, "\" has no sounds");
    }
    
    
    
    
    static __CreateFrom = function(_gain, _emitter)
    {
        if (_emitter == undefined)
        {
            _emitter = _emitterMap[? __emitterAlias];
        }
        
        var _voice = (new __VinylClassVoiceQueue(__templateName, __behaviour, __loopQueue, _gain, _emitter)).__voiceReference;
        VinylQueueSetArray(_voice, __soundArray);
        
        return _voice;
    }
    
    static __UpdateSetup = function(_soundArray, _behaviour, _loopQueue, _gain = 0, _emitterAlias = undefined)
    {
        __prevBehaviour = __behaviour;
        __prevLoopQueue = __loopQueue;
        
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
        
        __behaviour    = _behaviour;
        __loopQueue    = _loopQueue;
        __emitterAlias = _emitterAlias;
        
        if (__VINYL_RUNNING_FROM_IDE && (array_length(__soundArray) <= 0))
        {
            __VinylWarning("Queue template \"", __templateName, "\" has no sounds");
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
            queueTemplate: __templateName,
            sounds: _soundArray,
        };
        
        if (__behaviour != VINYL_QUEUE.DONT_LOOP) _struct.behavior = __behaviour;
        if (__loopQueue != false) _struct.loopQueue = __loopQueue;
        if (__emitterAlias != undefined) _struct.emitter = __emitterAlias;
        
        return _struct;
    }
    
    static __ExportGML = function(_buffer, _indent, _useMacros)
    {
        buffer_write(_buffer, buffer_text, _indent);
        buffer_write(_buffer, buffer_text, "{\n");
        
        buffer_write(_buffer, buffer_text, _indent);
        buffer_write(_buffer, buffer_text, "    queueTemplate: ");
        
        if (_useMacros)
        {
            buffer_write(_buffer, buffer_text, __VinylGetQueueTemplateMacro(__templateName));
            buffer_write(_buffer, buffer_text, ",\n");
        }
        else
        {
            buffer_write(_buffer, buffer_text, "\"");
            buffer_write(_buffer, buffer_text, __templateName);
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
        
        if (__behaviour != VINYL_QUEUE.DONT_LOOP)
        {
            buffer_write(_buffer, buffer_text, _indent);
            buffer_write(_buffer, buffer_text, "    behavior: ");
            buffer_write(_buffer, buffer_text, __behaviour);
            buffer_write(_buffer, buffer_text, ",\n");
        }
        
        if (__loopQueue != false)
        {
            buffer_write(_buffer, buffer_text, _indent);
            buffer_write(_buffer, buffer_text, "    loopQueue: ");
            buffer_write(_buffer, buffer_text, (__loopQueue == true)? "true" : "false");
            buffer_write(_buffer, buffer_text, ",\n");
        }
        
        if (__emitterAlias != false)
        {
            buffer_write(_buffer, buffer_text, _indent);
            buffer_write(_buffer, buffer_text, "    loopQueue: \"");
            buffer_write(_buffer, buffer_text, __emitterAlias);
            buffer_write(_buffer, buffer_text, "\",\n");
        }
        
        buffer_write(_buffer, buffer_text, _indent);
        buffer_write(_buffer, buffer_text, "},\n");
    }
}

function __VinylImportQueueTemplateJSON(_json)
{
    if (VINYL_SAFE_JSON_IMPORT)
    {
        var _variableNames = struct_get_names(_json);
        var _i = 0;
        repeat(array_length(_variableNames))
        {
            switch(_variableNames[_i])
            {
                case "queueTemplate":
                case "sound":
                case "sounds":
                case "behaviour":
                case "behavior":
                case "loopQueue":
                case "emitter":
                break;
                
                default:
                    __VinylError("Queue template property .", _variableNames[_i], " not supported");
                break;
            }
            
            ++_i;
        }
        
        if ((not struct_exists(_json, "sound")) && (not struct_exists(_json, "sounds")))
        {
            __VinylError("Queue template \"", _json.queueTemplate, "\" property .sounds must be defined");
        }
    }
   
    var _sounds = _json[$ "sounds"] ?? _json[$ "sound"];
    var _behaviour = (_json[$ "behavior"] ?? _json[$ "behaviour"]) ?? VINYL_QUEUE.DONT_LOOP;
    var _loopQueue = _json[$ "loopQueue"] ?? false;
    VinylSetupQueueTemplate(_json.queueTemplate, _sounds, _behaviour, _loopQueue, _json[$ "emitter"]);
    
    return _json.queueTemplate;
}