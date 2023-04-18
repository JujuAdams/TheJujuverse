/// Sets the playback position of a Vinyl voice
/// 
/// If passed a label name, every voice currently assigned to the label will
/// individually have its playback position set paused. This is the same as calling
/// VinylPositionSet() for each individual voice
/// 
/// This function CANNOT be used with audio played using VinylPlaySimple()
/// 
/// @param vinylID
/// @param position

function VinylPositionSet(_id, _position)
{
    static _globalData = __VinylGlobalData();
    static _idToVoiceDict = _globalData.__idToVoiceDict;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice)) return _voice.__RawPositionSet(_position);
    
    var _label = _globalData.__labelDict[$ _id];
    if (is_struct(_label)) return _label.__RawPositionSet(_position);
    
    __VinylTrace("Warning! Failed to execute VinylPositionSet() for ", _id);
}