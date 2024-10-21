// Feather disable all

/// Returns the sound asset that is currently being played by the target voice. If a blend voice
/// is targeted then this function will return an array of sound assets; otherwise, this function
/// will return a sound asset. If the voice is invalid then this function will return `undefined`.
/// 
/// @param voice

function VinylGetAsset(_voice)
{
    if (_voice == undefined) return undefined;
    
    return __VinylEnsureSoundVoice(_voice).__GetAsset();
}