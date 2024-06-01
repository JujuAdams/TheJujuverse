// Feather disable all

/// Fades out out a voice. Once a voice is set to fade out, it cannot be stopped. The rate of
/// change for this function is measured in "gain units per second".
/// 
/// @param voice
/// @param [rateOfChange]

function VinylFadeOut(_voice, _rateOfChange = VINYL_DEFAULT_FADE_OUT_RATE)
{
    if (_voice == undefined) return;
    __VinylEnsureSoundVoice(_voice).__FadeOut(max(0.001, _rateOfChange));
}