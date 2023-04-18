/// Resumes a paused voice, or all audio playing with the given label
/// 
/// If passed a label name, every voice currently assigned to the label will
/// individually be resumed. This is the same as calling VinylResume() for each individual
/// voice. The label itself has no "is paused" state
/// 
/// This function CANNOT be used with audio played using VinylPlaySimple()
/// 
/// @param vinylID/labelName

function VinylResume(_id)
{
    static _globalData = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice)) return _voice.__Resume();
    
    var _label = _globalData.__labelDict[$ _id];
    if (is_struct(_label)) return _label.__Resume();
    
    __VinylTrace("Warning! Failed to execute VinylResume() for ", _id);
}