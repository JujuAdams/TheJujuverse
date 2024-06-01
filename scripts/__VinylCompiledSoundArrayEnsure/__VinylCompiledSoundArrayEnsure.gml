// Feather disable all

function __VinylCompiledSoundArrayEnsure()
{
    static _array = asset_get_ids(asset_sound);
    
    var _i = 0;
    repeat(array_length(_array))
    {
        _array[_i] = audio_get_name(_array[_i]);
        ++_i;
    }
    
    return _array;
}