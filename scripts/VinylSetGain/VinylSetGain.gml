// Feather disable all

/// Sets the local gain for a voice. This is multipled with the sound/pattern gain set by the
/// corresponding setup function, the mix gain (if a mix is set for the voice), and the fade-out
/// gain to give the final playback gain for the voice. The rate of change for this function is
/// measured in "gain units per second".
/// 
/// @param voice
/// @param gain
/// @param [rateOfChange]

function VinylSetGain(_voice, _gain, _rateOfChange = infinity)
{
    if (_voice == undefined) return;
    __VinylEnsureSoundVoice(_voice).__SetLocalGain(max(0, _gain), max(0.001, _rateOfChange));
}