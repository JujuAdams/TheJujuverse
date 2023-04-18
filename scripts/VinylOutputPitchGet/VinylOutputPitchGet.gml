/// Returns the current output pitch for a voice or label
/// 
/// The value returned takes into account transposition, both local and global
/// 
/// This function CANNOT be used with audio played using VinylPlaySimple()
/// 
/// @param vinylID/labelName

function VinylOutputPitchGet(_id)
{
    static _globalData       = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _outputPitch = 1;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice))
    {
        _outputPitch = _voice.__PitchOutputGet();
    }
    else if (_id == undefined)
    {
        //Do nothing
    }
    else
    {
        var _label = _globalData.__labelDict[$ _id];
        if (is_struct(_label)) _outputPitch = _label.__PitchOutputGet();
    }
    
    return _outputPitch;
}