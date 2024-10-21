// Feather disable all

/// Sets the local pitch for the mix which is then applied to all audio played on this mix. Setting
/// the local pitch for a mix will affect all current and future audio played on the mix. The rate
/// of change for this function is measured in "pitch units per second".
/// 
/// @param mixName
/// @param pitch
/// @param [rateOfChange]

function VinylMixSetPitch(_mixName, _pitch, _rateOfChange = infinity)
{
    static _mixDict = __VinylSystem().__mixDict;
    
    var _mixStruct = _mixDict[$ _mixName];
    if (_mixStruct == undefined) __VinylError("Mix \"", _mixName, "\" not recognised");
    
    _mixStruct.__SetLocalPitch(max(0, _pitch), max(0.001, _rateOfChange));
}