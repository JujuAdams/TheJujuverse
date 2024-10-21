// Feather disable all

/// Fades out out a voice. Once a voice is set to fade out, it cannot be stopped. The rate of
/// change for this function is measured in "gain units per second". If the optional `pause`
/// parameter is set to `false` (the default) then the voice will stop once faded out. If the
/// `pause` parameter is set to `true` then the voice will be paused instead and can be unpaused
/// using the `VinylSetPause()` function. When resuming playback of the voice, it will *not* fade
/// in.
/// 
/// @param voice
/// @param [rateOfChange]
/// @param [pause=false]

function VinylFadeOut(_voice, _rateOfChange = VINYL_DEFAULT_FADE_OUT_RATE, _pause = false)
{
    if (_voice == undefined) return;
    
    __VinylEnsureSoundVoice(_voice).__FadeOut(max(0.001, _rateOfChange), _pause);
}