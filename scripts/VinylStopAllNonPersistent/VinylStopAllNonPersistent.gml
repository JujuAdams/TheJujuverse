/// Immediately stops all non-persistent Vinyl playback voices
/// 
/// This function will NOT affect audio played by VinylPlaySimple()

function VinylStopAllNonPersistent()
{
    static _topLevelArray = __VinylGlobalData().__topLevelArray;
    
    var _i = 0;
    repeat(array_length(_topLevelArray))
    {
        with(_topLevelArray[_i])
        {
            if (!__persistent) __Stop();
        }
        
        ++_i;
    }
}