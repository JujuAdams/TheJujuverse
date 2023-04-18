/// Returns whether a Multi voice is set to synchronise channel playback
/// 
/// @param vinylID

function VinylMultiSyncGet(_id)
{
    static _globalData = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice)) return _voice.__MultiSyncGet();
}