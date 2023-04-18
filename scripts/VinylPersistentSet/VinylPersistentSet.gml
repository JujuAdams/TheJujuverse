/// Sets the persistence state of a voice
/// 
/// If passed a label name, every voice currently assigned to the label will
/// individually have its persistence state set. This is the same as calling VinylPersistentSet()
/// for each individual voice
/// 
/// This function CANNOT be used with audio played using VinylPlaySimple()
/// 
/// @param vinylID/labelName
/// @param state

function VinylPersistentSet(_id, _state)
{
    static _globalData = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice)) return _voice.__PersistentSet(_state);
    
    var _label = _globalData.__labelDict[$ _id];
    if (is_struct(_label)) return _label.__PersistentSet(_state);
    
    __VinylTrace("Warning! Failed to execute VinylLoopSet() for ", _id);
}