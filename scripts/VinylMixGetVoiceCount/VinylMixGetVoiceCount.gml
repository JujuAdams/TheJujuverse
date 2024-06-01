// Feather disable all

/// Returns the number of voices currently playing on a mix. This function relies on the internal
/// voice counter for the mix. This counter updates slowly and can sometimes be inaccurate. If you
/// need very accurate voice counts then set the "moreAccurate" argument to <true>, though this
/// does carry a performance penalty.
/// 
/// @param mixName
/// @param [moreAccurate=false]

function VinylMixGetVoiceCount(_mixName, _moreAccurate = false)
{
    static _mixDict = __VinylSystem().__mixDict;
    
    var _mixStruct = _mixDict[$ _mixName];
    if (_mixStruct == undefined) __VinylError("Mix \"", _mixName, "\" not recognised");
    
    if (_moreAccurate)
    {
        var _array = _mixStruct.__voiceArray;
        
        var _i = 0;
        repeat(array_length(_array))
        {
            if (not VinylIsPlaying(_array[_i]))
            {
                array_delete(_array, _i, 1);
            }
            else
            {
                ++_i;
            }
        }
        
        return array_length(_array);
    }
    else
    {
        return array_length(_mixStruct.__voiceArray);
    }
}