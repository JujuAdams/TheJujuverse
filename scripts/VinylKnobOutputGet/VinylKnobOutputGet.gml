/// Returns the current *output* value for a knob
/// 
/// @param name

function VinylKnobOutputGet(_name)
{
    static _globalData = __VinylGlobalData();
    
    var _knob = _globalData.__knobDict[$ _name];
    if (!is_struct(_knob))
    {
        __VinylTrace("Warning! Knob \"", _name, "\" not recognised");
        return undefined;
    }
    
    return _knob.__OutputGet();
}