/// Returns whether the a voice is fading out (in "shutdown" mode)
/// Shutdown mode is started by calling VinylFadeOut()
/// 
/// This function cannot be used to target labels as shutdown state is set
/// per voice
/// 
/// This function CANNOT be used with audio played using VinylPlaySimple()
/// 
/// @param vinylID

function VinylShutdownGet(_id)
{
    static __idToVoiceDict = __VinylGlobalData().__idToVoiceDict;
    var _voice = __idToVoiceDict[? _id];
    return is_struct(_voice)? (_voice.__shutdown || _voice.__stopCallback) : undefined;
}