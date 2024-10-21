// Feather disable all

/// Returns the length of a sound asset that is currently being played by the target voice. If a
/// blend voice is targeted then this function will return the length of the first (0th index)
/// sound. If the voice is invalid then this function will return `0`. Setting the optional
/// `adjustForPitch` parameter to `true` will correct the returned value for the current pitch
/// of the voice (a higher pitch will reduce the playback time).
/// 
/// @param voice
/// @param [adjustForPitch=false]

function VinylGetLength(_voice, _adjustForPitch = false)
{
    if (_voice == undefined) return 0;
    
    var _result = __VinylEnsureSoundVoice(_voice).__GetAsset();
    if (is_array(_result))
    {
        if (array_length(_result) <= 0) return 0;
        _result = _result[0];
    }
    
    if (_adjustForPitch)
    {
        return audio_sound_length(_result) / max(0.0001, audio_sound_get_pitch(_result));
    }
    else
    {
        return audio_sound_length(_result);
    }
}