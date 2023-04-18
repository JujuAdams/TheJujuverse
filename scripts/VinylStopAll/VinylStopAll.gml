/// Immediately stops all Vinyl playback voices
/// 
/// This function will NOT affect audio played by VinylPlaySimple()

function VinylStopAll()
{
    static _topLevelArray = __VinylGlobalData().__topLevelArray;
    
    var _i = 0;
    repeat(array_length(_topLevelArray))
    {
        _topLevelArray[_i].__Stop();
        ++_i;
    }
}