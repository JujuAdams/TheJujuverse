/// @param value
/// @param propertyName
/// @param allowArray
/// @param scope

function __VinylParseKnob(_value, _propertyName, _allowArray, _scope)
{
    var _knobDict = __VinylGlobalData().__knobDict;
    
    var _knobName = undefined;
    var _rangeLo  = undefined;
    var _rangeHi  = undefined;
    
    if (is_array(_value))
    {
        if (array_length(_value) == 3)
        {
            _knobName = _value[0];
            _rangeLo  = _value[1];
            _rangeHi  = _value[2];
            
            if (!is_string( _knobName)) __VinylError("Error in ", self, " for \"", _propertyName, "\" property\nKnob name should be a string");
            if (!is_numeric(_rangeLo )) __VinylError("Error in ", self, " for \"", _propertyName, "\" property\nKnob output range should two numbers");
            if (!is_numeric(_rangeHi )) __VinylError("Error in ", self, " for \"", _propertyName, "\" property\nKnob output range should two numbers");
        }
        else if (!_allowArray)
        {
            __VinylError("Error in ", self, "\n\"", _propertyName, "\" property must be a number or a knob");
        }
    }
    else if (is_string(_value))
    {
        _knobName = _value;
    }
    
    if (_knobName != undefined)
    {
        if (string_char_at(_knobName, 1) == "@")
        {
            _knobName = string_delete(_knobName, 1, 1);
        }
        else
        {
            __VinylError("Error in ", self, " for \"", _propertyName, "\"\nKnob name must start with an @");
        }
        
        var _knob = _knobDict[$ _knobName];
        if (!is_struct(_knob)) __VinylError("Error in ", self, " for \"", _propertyName, "\" property\nKnob \"", _knobName, "\" doesn't exist");
        
        _knob.__TargetCreate(_scope, _propertyName, _rangeLo, _rangeHi);
        if ((_rangeLo != undefined) && (_rangeHi != undefined))
        {
            return lerp(_rangeLo, _rangeHi, _knob.__valueParam);
        }
        else
        {
            return _knob.__OutputGet();
        }
    }
}