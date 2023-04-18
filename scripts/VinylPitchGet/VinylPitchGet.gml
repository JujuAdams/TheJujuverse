/// Returns the current input pitch for a voice or label
/// 
/// This function CANNOT be used with audio played using VinylPlaySimple()
/// 
/// @param vinylID/labelName

function VinylPitchGet(_id)
{
    static _globalData = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _pitch = 1;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice))
    {
        _pitch = _voice.__PitchGet();
    }
    else if (_id == undefined)
    {
        //Do nothing
    }
    else
    {
        var _label = _globalData.__labelDict[$ _id];
        if (is_struct(_label)) _pitch = _label.__PitchGet();
    }
    
    return _pitch;
}