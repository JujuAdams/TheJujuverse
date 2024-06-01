// Feather disable all

/// Sets the master (global) gain for all audio, including audio not played with Vinyl.
/// 
/// @param gain

function VinylMasterSetGain(_gain)
{
    static _system = __VinylSystem();
    
    _gain = max(_gain, 0);
    
    audio_master_gain(VINYL_MASTER_GAIN_BOOST*VINYL_MAX_VOICE_GAIN*_gain);
    __masterGain = _gain;
}