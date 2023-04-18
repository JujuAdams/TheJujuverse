/// Returns the system gain, as set by VinylSystemGainSet()

function VinylSystemGainGet()
{
    return audio_get_master_gain(0) / VINYL_MAX_GAIN;
}