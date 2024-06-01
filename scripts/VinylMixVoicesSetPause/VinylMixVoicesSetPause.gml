// Feather disable all

/// Pauses or unpauses all voices currently playing in a given mix. These voices can be
/// individually resumed using VinylSetPause() or can be resumed all together by calling
/// VinylMixVoicesSetPause() again.
/// 
/// @param mixName
/// @param state

function VinylMixVoicesSetPause(_mixName, _state)
{
    static _mixDict = __VinylSystem().__mixDict;
    
    var _mixStruct = _mixDict[$ _mixName];
    if (_mixStruct == undefined) __VinylError("Mix \"", _mixName, "\" not recognised");
    
    _mixStruct.__VoicesSetPause(_state);
}