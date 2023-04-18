/// Returns if a voice is paused
/// 
/// This function will return <undefined> if passed a label name as labels cannot have a "paused"
/// state in themselves. This function will further return <undefined> for audio played using
/// VinylPlaySimple()
/// 
/// @param vinylID

function VinylPausedGet(_id)
{
    static _idToVoiceDict = __VinylGlobalData().__idToVoiceDict;
    var _voice = _idToVoiceDict[? _id];
    return (_voice == undefined)? undefined : _voice.__PauseGet();
}