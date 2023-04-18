/// Returns the current transposition for a voice or label
/// 
/// This function does NOT take into account global transposition
/// 
/// @param vinylID/labelName

function VinylTransposeGet(_id)
{
    static _globalData       = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice)) return _voice.__TransposeGet();
    
    var _label = _globalData.__labelDict[$ _id];
    if (is_struct(_label)) return _label.__TransposeGet();
    
    return 0;
}