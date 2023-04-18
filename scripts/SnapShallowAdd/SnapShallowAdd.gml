/// @returm N/A (undefined)
/// 
/// This function adds numbers stored in one struct/array to numbers stored in another struct/array. This is a non-recursive operation.
/// If the structure of the two inputs do not match then the source struct/array takes precedence, albeit softly:
/// 
/// 1. If a source array is larger than the equivalent destination array then the destination array is sized up (new array elements are initialized to zero before adding the source value)
/// 2. If a source array is smaller than the equivalent destination array then the destination array's length doesn't change
/// 3. If member variables are in a source struct but not the equivalent destination struct then new member variables are added to the destination struct
/// 4. Member variables that are not in a source struct but are in the equivalent destination struct will be kept in the destination struct
/// 5. If a value in a destination struct/array is non-numeric then it is re-initialized to zero before adding the source value
/// 
/// @param source                    Source struct/array
/// @param destination               Destination struct/array
/// @param [ignoreNonNumbers=false]  Set to <true> to quietly ignore non-numeric values in the source struct/array. The default value <false> will throw an error if a non-number is found in the source struct/array
/// 
/// @jujuadams 2022-10-30

function SnapShallowAdd(_src, _dst)
{
    if (is_struct(_src))
    {
        if (!is_struct(_dst)) show_error("SNAP:\nSource is a struct but destination is not a struct (=" + typeof(_dst) + ")", true);
        
        var _srcNames = variable_struct_get_names(_src);
        var _i = 0;
        repeat(array_length(_srcNames))
        {
            var _name = _srcNames[_i];
            var _srcValue = _src[$ _name];
            
            if (is_numeric(_srcValue))
            {
                var _dstValue = _dst[$ _name];
                if (!is_numeric(_dstValue)) _dstValue = 0;
                _dst[$ _name] = _dstValue + _srcValue;
            }
            
            ++_i;
        }
    }
    else if (is_array(_src))
    {
        if (!is_array(_dst)) show_error("SNAP:\nSource is an array but destination is not an array (=" + typeof(_dst) + ")", true);
        
        var _srcLength = array_length(_src);
        var _dstLength = array_length(_dst);
        if (_srcLength > _dstLength) array_resize(_dst, _srcLength);
        
        var _i = 0;
        repeat(array_length(_srcLength))
        {
            var _srcValue = _src[_i];
            
            if (is_numeric(_srcValue))
            {
                var _dstValue = _dst[_i];
                if (!is_numeric(_dstValue)) _dstValue = 0;
                _dst[@ _i] = _dstValue + _srcValue;
            }
            
            ++_i;
        }
    }
    else
    {
        show_error("SNAP:\nSource data structure is not a struct or array", true);
    }
}
