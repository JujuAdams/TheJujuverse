// Feather disable all

/// Returns the local gain for the mix.
/// 
/// @param mixName

function VinylMixGetGain(_mixName)
{
    static _mixDict = __VinylSystem().__mixDict;
    
    var _mixStruct = _mixDict[$ _mixName];
    if (_mixStruct == undefined) __VinylError("Mix \"", _mixName, "\" not recognised");
    
    return _mixStruct.__gainLocal;
}