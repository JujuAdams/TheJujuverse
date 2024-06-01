// Feather disable all

/// Returns the voice currently playing on the ducker with the given priority. If either the ducker
/// doesn't exist or no voice is playing with that priority then this function returns <undefined>.
/// 
/// @param duckerName
/// @param priority

function VinylDuckerGetVoice(_duckerName, _priority)
{
    static _duckerDict = __VinylSystem().__duckerDict;
    
    var _duckerStruct = _duckerDict[$ _duckerName];
    if (_duckerStruct == undefined) return;
    
    return _duckerStruct.__Get(_priority);
}