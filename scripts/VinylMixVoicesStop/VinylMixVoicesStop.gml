// Feather disable all

/// Immediately stops all voices currently playing in a given mix.
/// 
/// @param mixName

function VinylMixVoicesStop(_mixName)
{
    static _mixDict = __VinylSystem().__mixDict;
    
    var _mixStruct = _mixDict[$ _mixName];
    if (_mixStruct == undefined) __VinylError("Mix \"", _mixName, "\" not recognised");
    
    _mixStruct.__VoicesStop();
}