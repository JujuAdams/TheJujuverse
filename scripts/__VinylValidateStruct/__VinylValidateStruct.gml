function __VinylValidateStruct(_dataStruct, _expectedVariableArray)
{
    if (!VINYL_CONFIG_VALIDATE_PROPERTIES) return;
    
    //Iterate over every member variable and check to see if it's present in our list of permitted variable names
    var _namesArray = variable_struct_get_names(_dataStruct);
    var _i = 0;
    repeat(array_length(_namesArray))
    {
        var _name = _namesArray[_i];
        if (!array_contains(_expectedVariableArray, _name)) __VinylError("Property \"", _name, "\" invalid for ", self);
        ++_i;
    }
}