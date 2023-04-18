/// Pushes an asset onto a Queue voice, or Queue voices assigned to a label
/// 
/// If this function is given a label name then all currently playing Queue voices assigned
/// with that label will have that asset pushed
/// 
/// If the dontRepeatLast argument is set to <true> then a duplicate asset cannot be pushed
/// to the end of a queue
///
/// @param vinylID
/// @param asset
/// @param [dontRepeatLast=false]

function VinylQueuePush(_id, _asset, _dontRepeatLast = false)
{
    static _globalData = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice)) return _voice.__QueuePush(_asset, _dontRepeatLast);
    
    var _label = _globalData.__labelDict[$ _id];
    if (is_struct(_label)) return _label.__QueuePush(_asset, _dontRepeatLast);
    
    __VinylTrace("Warning! Failed to execute VinylQueuePush() for ", _id);
}