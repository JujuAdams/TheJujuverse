// Feather disable all

/// Returns the native GameMaker voice index that is currently being played by the target Vinyl
/// voice. If a blend voice is targeted then this function will return an array of GameMaker voice
/// indexes; otherwise, this function will return a GameMaker voice index. If the voice is invalid
/// then this function will return `undefined`.
/// 
/// @param voice

function VinylGetGMVoice(_voice)
{
    if (_voice == undefined) return undefined;
    
    return __VinylEnsureSoundVoice(_voice).__GetGameMakerVoice();
}