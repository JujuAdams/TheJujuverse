// Feather disable all

/// @param replace
/// @param [oldSoundNameArray]
/// @param [oldPatternNameArray]

function __VinylResolveChanges(_replace, _oldSoundNameArray = undefined, _oldPatternNameArray = undefined)
{
    static _toUpdateArray    = __VinylSystem().__toUpdateArray;
    static _voiceToStructMap = __VinylSystem().__voiceToStructMap;
    static _voiceUpdateArray = __VinylSystem().__voiceUpdateArray;
    static _soundDict        = __VinylSystem().__soundDict;
    static _patternDict      = __VinylSystem().__patternDict;
    
    var _voiceToStructArray = ds_map_values_to_array(_voiceToStructMap);
    
    //Strip out duplicates
    array_resize(_toUpdateArray, array_unique_ext(_toUpdateArray));
    
    if (_replace)
    {
        var _i = 0;
        repeat(array_length(_oldSoundNameArray))
        {
            var _pattern = _soundDict[$ _oldSoundNameArray[_i]];
            if (not array_contains(_toUpdateArray, _pattern)) _pattern.__ClearSetup();
            ++_i;
        }
        
        var _i = 0;
        repeat(array_length(_oldPatternNameArray))
        {
            var _pattern = _patternDict[$ _oldPatternNameArray[_i]];
            if (not array_contains(_toUpdateArray, _pattern)) _pattern.__ClearSetup();
            ++_i;
        }
    }
    
    //First phase - Convert updated patterns into currently playing voices that we need to update
    var _i = 0;
    repeat(array_length(_toUpdateArray))
    {
        var _pattern = _toUpdateArray[_i];
        
        switch(instanceof(_pattern))
        {
            case "__VinylClassPatternSound":
                var _sound = _pattern.__sound;
                
                var _j = 0;
                repeat(array_length(_voiceToStructArray))
                {
                    _voiceToStructArray[_j].__QueueUpdateForSound(_sound);
                    ++_j;
                }
                
                var _j = 0;
                repeat(array_length(_voiceUpdateArray))
                {
                    _voiceUpdateArray[_j].__QueueUpdateForSound(_sound);
                    ++_j;
                }
            break;
            
            case "__VinylClassPatternShuffle":
            case "__VinylClassPatternBlend":
                var _j = 0;
                repeat(array_length(_voiceToStructArray))
                {
                    if (_voiceToStructArray[_j][$ "__pattern"] == _pattern)
                    {
                        array_push(_toUpdateArray, _voiceToStructArray[_j]);
                    }
                    
                    ++_j;
                }
            break;
            
            case "__VinylClassPatternHLT":
                var _j = 0;
                repeat(array_length(_voiceUpdateArray))
                {
                    if (_voiceUpdateArray[_j][$ "__pattern"] == _pattern)
                    {
                        array_push(_toUpdateArray, _voiceUpdateArray[_j]);
                    }
                    
                    ++_j;
                }
            break;
            
            case "__VinylClassMix":
                var _array = _pattern.__voiceArray;
                var _j = 0;
                repeat(array_length(_array))
                {
                    array_push(_toUpdateArray, __VinylEnsureSoundVoice(_array[_i]));
                    ++_j;
                }
            break;
            
            case "__VinylClassDucker":
                var _array = _pattern.__voiceArray;
                var _j = 0;
                repeat(array_length(_array))
                {
                    array_push(_toUpdateArray, _array[_j]);
                    ++_j;
                }
                
                //Reset the ducker too
                array_resize(_array, 0);
                array_resize(_pattern.__priorityArray, 0);
                _pattern.__maxPriority = -infinity;
            break;
            
            case "__VinylClassQueueTemplate":
                var _j = 0;
                repeat(array_length(_voiceUpdateArray))
                {
                    if (_voiceUpdateArray[_j][$ "__templateName"] == _pattern)
                    {
                        array_push(_toUpdateArray, _voiceUpdateArray[_j]);
                    }
                    
                    ++_j;
                }
            break;
            
            default:
                __VinylError("Unhandled first-tier update struct, instanceof = \"", instanceof(_pattern), "\"");
            break;
        }
        
        array_delete(_toUpdateArray, _i, 1);
    }
    
    //Strip out duplicates again
    array_resize(_toUpdateArray, array_unique_ext(_toUpdateArray));
    
    //Execute update calls for every voice that needs updating
    var _i = 0;
    repeat(array_length(_toUpdateArray))
    {
        var _voice = _toUpdateArray[_i];
        
        switch(instanceof(_voice))
        {
            case "__VinylClassVoiceSound":
            case "__VinylClassVoiceShuffle":
            case "__VinylClassVoiceHLT":
            case "__VinylClassVoiceBlend":
            case "__VinylClassVoiceQueue":
                _voice.__UpdateFromPattern();
            break;
            
            default:
                __VinylError("Unhandled second-tier update struct, instanceof = \"", instanceof(_pattern), "\"");
            break;
        }
        
        ++_i;
    }
    
    array_resize(_toUpdateArray, 0);
}