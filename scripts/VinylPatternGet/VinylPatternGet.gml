/// Returns the pattern used to create a voice
/// 
/// @param voice

function VinylPatternGet(_id)
{
    static _globalData    = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice)) return _voice.__PatternTopGet();
    
    return undefined;
}