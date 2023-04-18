/// Sets the *input* value of the named knob
/// 
/// @param name
/// @param value

function VinylKnobSet(_name, _value)
{
    static _globalData = __VinylGlobalData();
    
    var _knob = _globalData.__knobDict[$ _name];
    if (!is_struct(_knob))
    {
        __VinylTrace("Warning! Knob \"", _name, "\" not recognised");
        return;
    }
    
    return _knob.__Set(_value);
}