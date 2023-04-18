/// Resets a knob to the default defined in the config file
/// 
/// @param name

function VinylKnobReset(_name)
{
    static _globalData = __VinylGlobalData();
    
    var _knob = _globalData.__knobDict[$ _name];
    if (!is_struct(_knob))
    {
        __VinylTrace("Warning! Knob \"", _name, "\" not recognised");
        return;
    }
    
    return _knob.__Reset();
}