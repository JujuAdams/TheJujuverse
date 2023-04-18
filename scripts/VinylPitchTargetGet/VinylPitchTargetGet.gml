/// Returns the current input pitch target for a voice or label
/// 
/// This function will not affect currently playing audio played using VinylPlaySimple()
/// 
/// @param vinylID/labelName

function VinylPitchTargetGet(_id)
{
    static _globalData = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _pitchTarget = 1;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice))
    {
        _pitchTarget = _voice.__PitchTargetGet();
    }
    else if (_id == undefined)
    {
        //Do nothing
    }
    else
    {
        var _label = _globalData.__labelDict[$ _id];
        if (is_struct(_label)) _pitchTarget = _label.__PitchTargetGet();
    }
    
    return _pitchTarget;
}