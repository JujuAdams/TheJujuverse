// Feather disable all

/// @param voiceReference
/// @oaram newMixName

function __VinylVoiceMoveMix(_voiceReference, _newMixName)
{
    static _mixDict = __VinylSystem().__mixDict;
    
    if (__mixName != _newMixName)
    {
        if (__mixName != undefined)
        {
            var _oldMixStruct = _mixDict[$ __mixName];
            if (_oldMixStruct != undefined) _oldMixStruct.__Remove(_voiceReference);
        }
        
        __mixName = _newMixName;
    }
    
    if (_newMixName == undefined)
    {
        var _mixStruct = undefined;
        __gainMix  = 1;
        __pitchMix = 1;
    }
    else
    {
        var _mixStruct = _mixDict[$ __mixName];
        if (_mixStruct == undefined)
        {
            __VinylError("Mix \"", __mixName, "\" not recognised");
            return;
        }
        
        __gainMix  = _mixStruct.__gainFinal;
        __pitchMix = _mixStruct.__pitchLocal;
        
        _mixStruct.__Add(_voiceReference);
    }
    
    return _mixStruct;
}