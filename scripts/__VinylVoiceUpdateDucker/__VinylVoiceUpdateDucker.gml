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
    
    if (_duckerNameFinal != undefined)
    {
        var _duckerStruct = _duckerDict[$ _duckerNameFinal];
        if (_duckerStruct == undefined)
        {
            __VinylWarning("Ducker \"", _duckerNameFinal, "\" not recognised");
            __Duck(1, __VINYL_DEFAULT_DUCK_RATE_OF_GAIN, __VINYL_DUCK.__DO_NOTHING);
            return;
        }
        
        _duckerStruct.__Push(self, __duckPrioLocal ?? (__pattern.__duckPrio ?? 0), true);
    }
    else
    {
        __Duck(1, __VINYL_DEFAULT_DUCK_RATE_OF_GAIN, __VINYL_DUCK.__DO_NOTHING);
    }
}