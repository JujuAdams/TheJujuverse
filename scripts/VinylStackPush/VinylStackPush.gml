/// @param name
/// @param priority
/// @param vinylID

function VinylStackPush(_name, _priority, _id)
{
    static _idToVoiceDict = __VinylGlobalData().__idToVoiceDict;
    static _stackDict        = __VinylGlobalData().__stackDict;
    
    var _voice = _idToVoiceDict[? _id];
    if (is_struct(_voice))
    {
        var _stack = _stackDict[$ _name];
        if (!is_struct(_stack))
        {
            __VinylTrace("Warning! Stack \"", _name, "\" not recognised");
            return;
        }
        
        return _stack.__Push(_priority, _voice, false);
    }
}