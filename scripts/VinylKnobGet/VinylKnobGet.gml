/// Returns the current *input* value for a knob
/// 
/// @param name

function VinylKnobGet(_name)
{
    static _globalData = __VinylGlobalData();
    
    var _knob = _globalData.__knobDict[$ _name];
    if (!is_struct(_knob))
    {
        __VinylTrace("Warning! Knob \"", _name, "\" not recognised");
        return undefined;
    }
    
    return _knob.__InputGet();
}