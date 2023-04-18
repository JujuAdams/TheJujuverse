/// Sets the gain for a channel for a Multi voice, or label
/// This gain is applied multiplicatively with the overall gain of the Multi voice
/// Setting a channel gain with this function overrides VinylMultiBlendSet()
/// 
/// If this function is given a label name then all current multi voices assigned to that label
/// will have their channel gain adjusted
/// 
/// @param vinylID
/// @param index
/// @param gain

function VinylMultiGainSet(_id, _index, _gain)
{
    static _globalData = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice)) return _voice.__MultiGainSet(_index, _gain);
    
    var _label = _globalData.__labelDict[$ _id];
    if (is_struct(_label)) return _label.__MultiGainSet(_index, _gain);
    
    __VinylTrace("Warning! Failed to execute VinylMultiGainSet() for ", _id);
}