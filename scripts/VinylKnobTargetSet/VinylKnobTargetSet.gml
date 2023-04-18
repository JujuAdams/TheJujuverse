/// Sets the target value for a knob
/// The knob's value will approach the target smoothly over a few frames, determined by the rate
/// 
/// @param name
/// @param targetValue
/// @param rate

function VinylKnobTargetSet(_name, _targetValue, _rate)
{
    static _globalData = __VinylGlobalData();
    
    var _knob = _globalData.__knobDict[$ _name];
    if (!is_struct(_knob))
    {
        __VinylTrace("Warning! Knob \"", _name, "\" not recognised");
        return;
    }
    
    return _knob.__TargetValueSet(_targetValue, _rate);
}