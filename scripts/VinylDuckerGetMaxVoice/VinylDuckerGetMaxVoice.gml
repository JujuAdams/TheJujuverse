// Feather disable all

/// Returns the voice with the maximum priority out of all sounds currently playing. If either the
/// ducker doesn't exist or no audio is playing on the ducker then this function returns
/// <undefined>.
/// 
/// @param duckerName

function VinylDuckerGetMaxVoice(_duckerName)
{
    static _duckerDict = __VinylSystem().__duckerDict;
    
    var _duckerStruct = _duckerDict[$ _duckerName];
    if (_duckerStruct == undefined) return;
    
    return _duckerStruct.__Get(_duckerStruct.__maxPriority);
}