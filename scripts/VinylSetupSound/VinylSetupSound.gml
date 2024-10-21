// Feather disable all

/// Sets up a sound asset for playback with Vinyl. This is an optional function and any sound asset
/// without a Vinyl definition will be played at unity gain and on the default mix.
/// 
/// If the `emitterAlias` parameter is defined, Vinyl will attempt to play the sound on the
/// specified emitter if the sound is played directly (i.e. not played via another pattern). You
/// can register an emitter with `VinylRegisterEmitter()`.
/// 
/// You should typically only call this function once on boot or if you're reloading configuration
/// data due to the presence of mods. Subsequent calls to this function will only affect audio that
/// is already playing if VINYL_LIVE_EDIT is set to <true>, and even then calls to this function
/// whilst audio is playing is expensive.
/// 
/// @param sound
/// @param [gain=1]
/// @param [pitch=1]
/// @param [loop]
/// @param [mix=VINYL_DEFAULT_MIX]
/// @param [duckerName]
/// @param [duckPriority=0]
/// @param [emitterAlias]
/// @param [metadata]

function VinylSetupSound(_sound, _gain = 1, _pitch = 1, _loop = undefined, _mixName = VINYL_DEFAULT_MIX, _duckerName = undefined, _duckPrio = undefined, _emitterAlias = undefined, _metadata = undefined)
{
    static _system = __VinylSystem();
    
    if (is_array(_gain))
    {
        __VinylError("Cannot use an array as a sound gain");
    }
    
    if (is_array(_pitch))
    {
        __VinylError("Cannot use an array as a sound pitch");
    }
    
    if (_mixName == VINYL_NO_MIX) _mixName = undefined;
    __VinylEnsurePatternSound(_sound).__UpdateSetup(_gain, _pitch, _loop, _mixName, _duckerName, _duckPrio, _emitterAlias, _metadata);
    
    if (VINYL_LIVE_EDIT && (not _system.__importingJSON))
    {
        __VinylResolveChanges(false);
    }
}