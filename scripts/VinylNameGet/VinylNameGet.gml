/// Returns the friendly, humand-readable name of a Vinyl voice
/// 
/// @param voice

function VinylNameGet(_id)
{
    static _globalData    = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice)) return string(_voice);
    
    return undefined;
}