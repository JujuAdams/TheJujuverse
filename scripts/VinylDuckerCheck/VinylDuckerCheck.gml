// Feather disable all

/// Checks whether a new voice played with the given priority would either not play, would replace
/// an existing voice, or would become the new maximum priority voice. This function returns one
/// of the following values:
/// 
///  0 = Priority is below the current maximum priority
///  1 = Priority is equal to the current maximum priority
///  2 = Priority is above the current maximum priority
///  <undefined> = Ducker name not recognised
/// 
/// @param duckerName
/// @param priority

function VinylDuckerCheck(_name, _priority)
{
    static _duckerDict = __VinylSystem().__duckerDict;
    
    var _duckerStruct = _duckerDict[$ _duckerName];
    if (_duckerStruct == undefined) return undefined;
    
    if (_priority > _duckerStruct.__maxPriority)
    {
        return 2;
    }
    else if (_priority == _duckerStruct.__maxPriority)
    {
        return 1;
    }
    else // (_priority < _duckerStruct.__maxPriority)
    {
        return 0;
    }
}