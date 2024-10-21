// Feather disable all

/// Resumes playback of a paused voice.
/// 
/// @param voice

function VinylResume(_voice)
{
    static _seen = false;
    if (not _seen)
    {
        __VinylWarning("VinylResume() has been deprecated. Please use VinylSetPause() instead");
        _seen = true;
    }
    
    VinylSetPause(_voice, false);
}