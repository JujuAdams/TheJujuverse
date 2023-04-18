/// Sets the transposition of a voice, or label
/// 
/// Transposition is applied multiplicatively with pitch. Any voice that has transposition
/// set (even if that value is 0) will further be affected by the global transposition value. See
/// VinylGlobalTranspositionSet() for more details
/// 
/// If this function is given a label name then all currently playing audio assigned with that
/// label will be immediately affected by the change in transposition
///
/// This function CANNOT be used with audio played using VinylPlaySimple()
/// 
/// @param vinylID/labelName
/// @param semitones

function VinylTransposeSet(_id, _semitone)
{
    static _globalData = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice)) return _voice.__TransposeSet(_semitone);
    
    var _label = _globalData.__labelDict[$ _id];
    if (is_struct(_label)) return _label.__TransposeSet(_semitone);
    
    __VinylTrace("Warning! Failed to execute VinylTransposeSet() for ", _id);
}