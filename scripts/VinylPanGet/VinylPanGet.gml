/// Returns the current pan for a voice
/// 
/// This function CANNOT be used with audio played using VinylPlaySimple()
/// 
/// @param vinylID

function VinylPanGet(_id)
{
    static _globalData = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _pan = 0;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice))
    {
        if (!_voice.__usingPanEmitter || (_voice.__vinylEmitter == undefined)) return undefined;
        _pan = _voice.__vinylEmitter.__pan;
    }
    else if (_id == undefined)
    {
        //Do nothing
    }
    else
    {    
        var _label = _globalData.__labelDict[$ _id];
        if (is_struct(_label)) __VinylError("Cannot get or set panning for labels");
    }
    
    return _pan;
}