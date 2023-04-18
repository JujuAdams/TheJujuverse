/// Sets the input gain of a voice or label
/// Setting gain with this function immediately resets the gain target (as set by VinylGainTargetSet())
/// 
/// If this function is given a label name then all currently playing audio assigned with that label will
/// be immediately affected by the change in the label's gain state
/// 
/// This function will not affect currently playing audio played using VinylPlaySimple()
/// 
/// @param target
/// @param gain

function VinylGainSet(_target, _gain)
{
    static _globalData = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _voice = _idToVoiceDict[? _target];
    if (is_struct(_voice)) return _voice.__GainSet(_gain);
    
    var _label = _globalData.__labelDict[$ _target];
    if (is_struct(_label)) return _label.__GainSet(_gain);
    
    __VinylTrace("Warning! Failed to execute VinylGainSet() for ", _target);
}