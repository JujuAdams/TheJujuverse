/// Returns the current output gain for a voice or label
/// 
/// This function CANNOT be used with audio played using VinylPlaySimple()
/// 
/// @param vinylID/labelName

function VinylOutputGainGet(_id)
{
    static _globalData = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _outputGain = 0;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice))
    {
        _outputGain = _voice.__GainOutputGet();
    }
    else if (_id == undefined)
    {
        //Do nothing
    }
    else
    {
        var _label = _globalData.__labelDict[$ _id];
        if (is_struct(_label)) _outputGain = _label.__GainOutputGet();
    }
    
    return _outputGain;
}