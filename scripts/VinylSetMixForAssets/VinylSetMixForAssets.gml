// Feather disable all

/// Sets the mix for multiple sounds and patterns. This function can take multiple arguments and/or
/// arguments can specify an array of sounds and patterns to set a mix for.
/// 
/// @param mixName
/// @param sound/pattern/array
/// @param ...

function VinylSetMixForAssets()
{
    static _system        = __VinylSystem();
    static _toUpdateArray = _system.__toUpdateArray;
    static _soundDict     = _system.__soundDict;
    static _patternDict   = _system.__patternDict;
    
    var _mixName = argument[0];
    if (_mixName == VINYL_NO_MIX) _mixName = undefined;
    
    var _i = 1;
    repeat(argument_count-1)
    {
        var _inputArray = argument[_i];
        
        if (not is_array(_inputArray))
        {
            _inputArray = [_inputArray];
        }
        
        var _j = 0;
        repeat(array_length(_inputArray))
        {
            var _input = _inputArray[_j];
            
            if (is_handle(_input))
            {
                var _pattern = struct_get_from_hash(_soundDict, int64(_input));
                _pattern.__mixName = _mixName;
                
                if (VINYL_LIVE_EDIT) array_push(_toUpdateArray, _pattern);
            }
            else if (is_string(_input))
            {
                var _pattern = _patternDict[$ _input];
                if (_pattern == undefined)
                {
                    __VinylError("Pattern \"", _input, "\" not found");
                }
                else
                {
                    _pattern.__mixName = _mixName;
                }
            }
            else if (_input == undefined)
            {
                //Ignore!
            }
            else
            {
                __VinylError("Datatype not supported (", typeof(_input), ")");
            }
            
            ++_j;
        }
        
        ++_i;
    }
    
    if (VINYL_LIVE_EDIT && (not _system.__importingJSON))
    {
        __VinylResolveChanges(false);
    }
}