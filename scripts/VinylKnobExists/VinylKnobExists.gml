/// Returns if a knob with the given name exists
/// 
/// @param name

function VinylKnobExists(_name)
{
    static _globalData = __VinylGlobalData();
    return is_struct(_globalData.__knobDict[$ _name]);
}