/// Returns the BPM for a voice
/// 
/// This function CANNOT be used with audio played using VinylPlaySimple()
/// 
/// @param vinylID/labelName
/// @param [pitchAdjusted=false]

function VinylBPMGet(_id, _pitchAdjusted = false)
{
    static _idToVoiceDict = __VinylGlobalData().__idToVoiceDict;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice))
    {
        var _bpm = _voice.__PersistentGet();
        if (_pitchAdjusted) _bpm *= _voice.__PitchGet();
        return _bpm;
    }
    
    return 0;
}