/// Sets the panning for a voice
/// 
/// Panning can only be adjusted for Vinyl voices that were played with a panning value
/// initially, even if that panning value is 0 (centred)
/// 
/// This function CANNOT be used with audio played using VinylPlaySimple()
/// 
/// @param vinylID
/// @param pan

function VinylPanSet(_id, _pan)
{
    static _globalData       = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice))
    {
        if (!_voice.__usingPanEmitter)
        {
            __VinylError("Cannot set panning for a voice that was not created with a panning value");
        }
        
        if (_voice.__vinylEmitter != undefined)
        {
            _voice.__vinylEmitter.__Pan(_pan);
        }
    }
    
    var _label = _globalData.__labelDict[$ _id];
    if (is_struct(_label)) __VinylError("Cannot get or set panning for labels");
    
    __VinylTrace("Warning! Failed to execute VinylPanSet() for ", _id);
}