/// Returns the current target value for a knob
/// 
/// @param name

function VinylKnobTargetGet(_name)
{
    static _globalData = __VinylGlobalData();
    
    var _knob = _globalData.__knobDict[$ _name];
    if (!is_struct(_knob))
    {
        __VinylTrace("Warning! Knob \"", _name, "\" not recognised");
        return;
    }
    
    return _knob.__TargetValueGet();
}