/// Resets all knobs to their defaults defined in the config file

function VinylKnobResetAll()
{
    static _globalData = __VinylGlobalData();
    
    var _knobArray = _globalData.__knobArray;
    var _i = 0;
    repeat(array_length(_knobArray))
    {
        _knobArray[_i].__Reset();
        ++_i;
    }
}