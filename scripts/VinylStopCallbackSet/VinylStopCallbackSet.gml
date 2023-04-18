/// Adds an on-stop callback to a voice, or all voices assigned to the given label
/// 
/// This function CANNOT be used with audio played using VinylPlaySimple()
/// 
/// @param vinylID/labelName
/// @param callback
/// @param [callbackData]

function VinylStopCallbackSet(_id, _callback, _callbackData = undefined)
{
    static _globalData = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice)) return _voice.__StopCallbackSet(_callback, _callbackData);
    
    var _label = _globalData.__labelDict[$ _id];
    if (is_struct(_label)) return _label.__StopCallbackSet(_callback, _callbackData);
}