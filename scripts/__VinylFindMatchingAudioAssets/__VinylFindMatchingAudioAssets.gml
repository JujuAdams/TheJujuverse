// Feather disable all

/// @param searchString

function __VinylFindMatchingAudioAssets(_searchString)
{
    static _soundNameArray = __VinylCompiledSoundArrayEnsure();
    
    var _result = [];
    var _subArray = string_split(_searchString, "*", true);
    
    var _i = 0;
    repeat(array_length(_soundNameArray))
    {
        var _assetName = _soundNameArray[_i];
        
        var _accepted = true;
        var _pos = 1;
        var _j = 0;
        repeat(array_length(_subArray))
        {
            var _substring = _subArray[_j];
            
            _pos = string_pos_ext(_substring, _assetName, _pos);
            if (_pos <= 0)
            {
                _accepted = false;
                break;
            }
            
            ++_j;
        }
        
        if (_accepted)
        {
            array_push(_result, asset_get_index(_assetName));
        }
        
        ++_i;
    }
    
    return _result;
}
