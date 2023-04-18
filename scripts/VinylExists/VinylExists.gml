/// Returns if the given Vinyl ID is for an active voice
/// 
/// This function will ALWAYS return <false> for audio played using VinylPlaySimple()
/// 
/// @param vinylID

function VinylExists(_id)
{
    static _idToVoiceDict = __VinylGlobalData().__idToVoiceDict;
    return ds_map_exists(_idToVoiceDict, _id);
}