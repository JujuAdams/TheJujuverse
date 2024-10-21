// Feather disable all

/// Sets the local pitch for a voice. This is multipled with the sound/pattern pitch set by the
/// corresponding setup function and the mix pitch (if a mix is set for the voice) to give the
/// final playback pitch for the voice. The rate of change for this function is measured in "pitch
/// units per second".
/// 
/// @param voice
/// @param pitch
/// @param [rateOfChange]

function VinylSetPitch(_voice, _pitch, _rateOfChange = infinity)
{
    if (_voice == undefined) return;
    __VinylEnsureSoundVoice(_voice).__SetLocalPitch(max(0.001, _pitch), max(0.001, _rateOfChange));
}