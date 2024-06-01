// Feather disable all

/// @param sound
/// @param [strict=true]

function __VinylImportSound(_sound, _strict = true)
{
    if (is_string(_sound))
    {
        var _newSound = asset_get_index(_sound);
        if (_strict && (not audio_exists(_newSound))) __VinylError("Sound \"", _sound, "\" not found");
        return _newSound;
    }
    else if ((_sound == undefined) || (_sound == pointer_null))
    {
        return undefined;
    }
    else if (is_handle(_sound))
    {
        return _sound;
    }
    
    if (_strict) __VinylError("Datatype not supported (", typeof(_sound), ")");
}