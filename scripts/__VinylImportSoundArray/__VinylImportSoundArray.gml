// Feather disable all

/// @param array
/// @param [strict=true]

function __VinylImportSoundArray(_array, _strict)
{
    //Support lazy use of strings/handles as single element arrays
    if (not is_array(_array))
    {
        return [__VinylImportSound(_array)];
    }
    
    var _newArray = [];
    
    var _i = 0;
    repeat(array_length(_array))
    {
        var _sound = _array[_i];
        
        if (is_string(_sound))
        {
            var _newSound = asset_get_index(_sound);
            if (_strict && (not audio_exists(_newSound))) __VinylError("Sound \"", _sound, "\" not found");
            array_push(_newArray, _newSound);
        }
        else if (is_handle(_sound))
        {
            array_push(_newArray, _sound);
        }
        else
        {
            if (_strict) __VinylError("Datatype not supported (", typeof(_sound), ")");
        }
        
        ++_i;
    }
    
    if (array_length(_newArray) <= 0)
    {
        if (_strict) __VinylError("Sound array must have at least one sound in array (length=", array_length(_newArray), ")");
        array_push(_newArray, VinylFallbackSound);
    }
    
    return _newArray;
}