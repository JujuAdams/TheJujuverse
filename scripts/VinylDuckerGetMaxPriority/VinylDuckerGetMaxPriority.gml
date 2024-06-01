// Feather disable all

/// Returns the maximum priority out of all sounds currently playing. If either the ducker doesn't
/// exist or no audio is playing on the ducker then this function returns <-infinity>.
/// 
/// @param duckerName

function VinylDuckerGetMaxPriority(_duckerName)
{
    static _duckerDict = __VinylSystem().__duckerDict;
    
    var _duckerStruct = _duckerDict[$ _duckerName];
    if (_duckerStruct == undefined) return -infinity;
    
    return _duckerStruct.__maxPriority;
}