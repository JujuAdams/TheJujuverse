/// Sets the system-wide gain for Vinyl
/// 
/// This number is NOT constrained by the VINYL_MAX_GAIN value
/// 
/// @param gain

function VinylSystemGainSet(_gain)
{
    _gain = max(0, _gain);
    
    static _oldGain = undefined;
    if (_gain != _oldGain)
    {
        _oldGain = _gain;
        
        var _amplitude = VINYL_MAX_GAIN*_gain;
        audio_master_gain(_amplitude);
        
        __VinylTrace("Set system gain to ", _gain, " (VINYL_MAX_GAIN=", VINYL_MAX_GAIN, ", resultant gain=", _amplitude, ")");
    }
}