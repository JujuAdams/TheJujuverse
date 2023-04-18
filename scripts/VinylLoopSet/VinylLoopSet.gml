/// Sets the looping state of a voice. If a voice currently has loop points
/// enabled then turning off looping (setting state to <false>) will disable the loop points
/// and allow the audio to play to the end
/// 
/// If passed a label name, every voice currently assigned to the label will
/// individually have its loop state set. This is the same as calling VinylLoopSet() for each
/// individual voice
/// 
/// This function CANNOT be used with audio played using VinylPlaySimple()
/// 
/// @param vinylID/labelName
/// @param state

function VinylLoopSet(_id, _state)
{
    static _globalData = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice)) return _voice.__LoopSet(_state);
    
    var _label = _globalData.__labelDict[$ _id];
    if (is_struct(_label)) return _label.__LoopSet(_state);
    
    __VinylTrace("Warning! Failed to execute VinylLoopSet() for ", _id);
}