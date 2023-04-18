/// Returns the type for a voice
/// 
/// The value returned can be one of the following:
///   "asset"
///   "basic"
///   "queue"
///   "multi"
/// 
/// This function CANNOT be used with audio played using VinylPlaySimple()
/// 
/// @param vinylID

function VinylTypeGet(_id)
{
    static _globalData = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice)) return _voice.__patternType;
}