/// Sets the global transposition state
/// 
/// Global transposition only affect Vinyl voices that have had their transposition
/// state set by VinylTransposition() or labels/patterns, even if that value is 0
/// 
/// @param semitones

function VinylGlobalTransposeSet(_semitone)
{
    static _globalData  = __VinylGlobalData();
    if (_semitone != _globalData.__transpose)
    {
        __VinylTrace("Setting transpose to ", _semitone, " semitones");
        _globalData.__transpose = _semitone;
    }
}