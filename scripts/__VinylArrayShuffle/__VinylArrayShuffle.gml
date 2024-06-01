
function __VinylArrayShuffle(_array)
{
    var _i = array_length(_array) - 1;
    repeat(_i)
    {
        var _index = __VinylIRandom(_i);
        var _oldValue = _array[@ _index];
        
        _array[@ _index] = _array[_i];
        _array[@ _i    ] = _oldValue;
        
        --_i;
    }
}