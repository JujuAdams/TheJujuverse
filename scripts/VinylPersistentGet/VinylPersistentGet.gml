/// Returns the persistence state of a voice
/// 
/// This function will return <undefined> if passed a label name. This function will further
/// return <undefined> for audio played using VinylPlaySimple()
/// 
/// @param vinylID

function VinylPersistentGet(_id)
{
    static _idToVoiceDict = __VinylGlobalData().__idToVoiceDict;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice)) return _voice.__PersistentGet();
}