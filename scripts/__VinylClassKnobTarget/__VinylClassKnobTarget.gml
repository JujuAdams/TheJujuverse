/// @param scope
/// @param property
/// @param rangeLo
/// @param rangeHi

function __VinylClassKnobTarget(_scope, _property, _rangeLo, _rangeHi) constructor
{
    __scope         = _scope;
    __property      = _property;
    __rangeRemap    = ((_rangeLo != undefined) && (_rangeHi != undefined));
    __rangeOutputLo = _rangeLo;
    __rangeOutputHi = _rangeHi;
    
    if (is_instanceof(__scope, __VinylClassLabel)
    ||  is_instanceof(__scope, __VinylClassPatternFallback)
    ||  is_instanceof(__scope, __VinylClassPatternAsset)
    ||  is_instanceof(__scope, __VinylClassPatternBasic)
    ||  is_instanceof(__scope, __VinylClassPatternShuffle)
    ||  is_instanceof(__scope, __VinylClassPatternQueue)
    ||  is_instanceof(__scope, __VinylClassPatternMulti))
    {
        __mode = 1;
    }
    else
    {
        //Fallback for generic structs
        __mode = 0;
    }
    
    static __Update = function(_valueOutput, _parameter)
    {
        if (__rangeRemap)
        {
            //Remap the input value if we have a custom range
            _valueOutput = lerp(__rangeOutputLo, __rangeOutputHi, _parameter);
        }
        
        if (__mode == 0)
        {
            __scope[$ __property] = _valueOutput;
        }
        else if (__mode == 1) //Labels and Patterns
        {
            if (__property == "gain")
            {
                __scope.__GainSet(_valueOutput, true);
            }
            else if (__property == "pitch")
            {
                __scope.__PitchSet(_valueOutput, true);
            }
            else if (__property == "blend")
            {
                __scope.__MultiBlendSet(_valueOutput, true);
            }
        }
    }
}