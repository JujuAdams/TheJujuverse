/// Returns a struct containing the on-stop callback state of a voice
/// 
/// N.B. The returned struct is static. Do not keep a copy of this struct as it is liable to
///      change unexpectedly
/// 
/// This function will return <undefined> if passed a label name. This function will further
/// return <undefined> for audio played using VinylPlaySimple()
/// 
/// @param vinylID

function VinylStopCallbackGet(_id)
{
    static _idToVoiceDict = __VinylGlobalData().__idToVoiceDict;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice)) return _voice.__StopCallbackGet();
}