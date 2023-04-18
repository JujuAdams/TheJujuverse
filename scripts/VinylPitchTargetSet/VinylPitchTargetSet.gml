/// Sets the input pitch target for a voice or label
/// The input pitch will approach the target smoothly over a few frames, determined by the rate
/// 
/// If this function is given a label name then all currently playing audio assigned with that label will
/// be affected by the change in the label's pitch state
/// 
/// This function CANNOT be used with audio played using VinylPlaySimple()
/// 
/// @param vinylID/labelName
/// @param targetPitch
/// @param [rate=VINYL_DEFAULT_PITCH_RATE]

function VinylPitchTargetSet(_id, _targetPitch, _rate = VINYL_DEFAULT_PITCH_RATE)
{
    static _globalData = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice)) return _voice.__PitchTargetSet(_targetPitch, _rate);
    
    var _label = _globalData.__labelDict[$ _id];
    if (is_struct(_label)) return _label.__PitchTargetSet(_targetPitch, _rate);
    
    __VinylTrace("Warning! Failed to execute VinylPitchTargetSet() for ", _id);
}