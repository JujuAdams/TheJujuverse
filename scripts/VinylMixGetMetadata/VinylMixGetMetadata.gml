// Feather disable all

/// Returns the metadata associated with a mix, as set up by Vinyl's config JSON or a call to
/// VinylSetupMix().
/// 
/// @param mixName
/// @param [default=undefined]

function VinylMixGetMetadata(_mixName, _default = undefined)
{
    static _mixDict = __VinylSystem().__mixDict;
    
    var _mixStruct = _mixDict[$ _mixName];
    if (_mixStruct == undefined) __VinylError("Mix \"", _mixName, "\" not recognised");
    
    return _mixStruct.__metadata ?? _default;
}