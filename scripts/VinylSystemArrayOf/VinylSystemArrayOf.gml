/// Returns an array of names of all definitions for a particular type of Vinyl component
/// 
/// The type argument can be one of the follow values:
///   "patterns"
///   "assets"
///   "labels"
///   "effect chains"
///   "knobs"
///   "stacks"
/// 
/// @param type

function VinylSystemArrayOf(_type)
{
    static _globalData = __VinylGlobalData();
    
    var _return = [];
    
    switch(_type)
    {
        case "pattern":
        case "patterns":
            var _array = _globalData.__patternArray;
            var _i = 0;
            repeat(array_length(_array))
            {
                var _pattern = _array[_i];
                if ((not _pattern.__child) && (_pattern.__patternType != "asset")) array_push(_return, _pattern.__name);
                ++_i;
            }
        break;
        
        case "asset":
        case "assets":
            var _array = _globalData.__patternArray;
            var _i = 0;
            repeat(array_length(_array))
            {
                var _pattern = _array[_i];
                if ((not _pattern.__child) && (_pattern.__patternType == "asset")) array_push(_return, audio_get_name(_pattern.__asset));
                ++_i;
            }
        break;
        
        case "label":
        case "labels":
            var _array = _globalData.__labelArray;
            var _i = 0;
            repeat(array_length(_array))
            {
                array_push(_return, _array[_i].__name);
                ++_i;
            }
        break;
        
        case "effect chain":
        case "effect chains":
            var _array = _globalData.__effectChainArray;
            var _i = 0;
            repeat(array_length(_array))
            {
                array_push(_return, _array[_i].__name);
                ++_i;
            }
        break;
        
        case "knob":
        case "knobs":
            var _array = _globalData.__knobArray;
            var _i = 0;
            repeat(array_length(_array))
            {
                array_push(_return, _array[_i].__name);
                ++_i;
            }
        break;
        
        case "stack":
        case "stacks":
            var _array = _globalData.__stackArray;
            var _i = 0;
            repeat(array_length(_array))
            {
                array_push(_return, _array[_i].__name);
                ++_i;
            }
        break;
        
        default:
            __VinylError("Return type \"", _type, "\" unhandled");
        break;
    }
    
    return _return;
}