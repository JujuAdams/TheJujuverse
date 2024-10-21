// Feather disable all

function __VinylVoiceUpdateDucker(_mixStruct)
{
    static _duckerDict = __VinylSystem().__duckerDict;
    
    if (_mixStruct == undefined)
    {
        var _duckerNameFinal = __duckerNameLocal ?? __pattern.__duckerName;
    }
    else
    {
        var _duckerNameFinal = __duckerNameLocal ?? (__pattern.__duckerName ?? _mixStruct.__membersDuckOn);
    }
    
    //Remove this voice from the old ducker
    //We do this even if the old ducker if the same as the new ducker
    if (__duckerNameFinal != undefined)
    {
        var _duckerStruct = _duckerDict[$ __duckerNameFinal];
        if (_duckerStruct != undefined) _duckerStruct.__Remove(self);
    }
    
    //Update our internal ducker tracking
    __duckerNameFinal = _duckerNameFinal;
    
    if (_duckerNameFinal != undefined)
    {
        //Add this voice to the new ducker
        var _duckerStruct = _duckerDict[$ _duckerNameFinal];
        if (_duckerStruct == undefined)
        {
            __VinylWarning("Ducker \"", _duckerNameFinal, "\" not recognised");
            __Duck(1, __VINYL_DEFAULT_DUCK_RATE_OF_GAIN);
            return;
        }
        
        _duckerStruct.__Push(self, __duckPrioLocal ?? (__pattern.__duckPrio ?? 0), true);
    }
    else
    {
        //No ducker, no ducking
        __Duck(1, __VINYL_DEFAULT_DUCK_RATE_OF_GAIN);
    }
}