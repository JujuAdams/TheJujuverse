// Feather disable all

function __VinylWillStop(_voice)
{
    if (_voice == undefined) return true;
    if (not audio_is_playing(_voice)) return true;
    if (audio_sound_get_loop(_voice)) return false;
    if (audio_is_paused(_voice)) return false;
    
    if (audio_sound_get_loop_end(_voice) <= 0)
    {
        //No loop points
        return (audio_sound_get_track_position(_voice) >= audio_sound_length(_voice) - audio_sound_get_pitch(_voice)*VINYL_WILL_STOP_TOLERANCE/1000);
    }
    else
    {
        return (audio_sound_get_track_position(_voice) >= audio_sound_get_loop_end(_voice) - audio_sound_get_pitch(_voice)*VINYL_WILL_STOP_TOLERANCE/1000);
    }
}