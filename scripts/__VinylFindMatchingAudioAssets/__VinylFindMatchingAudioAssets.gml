/// @param searchString
/// @param assetNameArray

function __VinylFindMatchingAudioAssets(_searchString, _assetNameArray)
{
    static _result = [];
    array_resize(_result, 0);
    
    var _test = [];
    
    var _subArray = string_split(_searchString, "*", true);
    
    var _i = 0;
    repeat(array_length(_assetNameArray))
    {
        var _assetName = _assetNameArray[_i];
        
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
            array_push(_result, _i);
            array_push(_test, audio_get_name(_i));
        }
        
        ++_i;
    }
    
    return _result;
}