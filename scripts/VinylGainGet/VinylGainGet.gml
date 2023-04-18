/// Returns the current input gain for a voice or label
/// 
/// This function CANNOT be used with audio played using VinylPlaySimple()
/// 
/// @param vinylID/labelName

function VinylGainGet(_id)
{
    static _globalData = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _gain = 0;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice))
    {
        _gain = _voice.__GainGet();
    }
    else if (_id == undefined)
    {
        //Do nothing
    }
    else
    {    
        var _label = _globalData.__labelDict[$ _id];
        if (is_struct(_label)) _gain = _label.__GainGet();
    }
    
    return _gain;
}