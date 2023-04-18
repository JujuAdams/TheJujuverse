/// Disables interpolation for a given variable in a clock method for a single clock tick
/// 
/// This function can only be called in a clock method (either begin, normal, or end method)
/// 
/// The scope is determined by who calls IotaSkipInterpolation(). Occasionally you may need to force
/// the scope, and this can be done by setting the scope argument when calling this function
/// 
/// @param outName   Name of the output variable, as set when calling .VariableInterpolate()
/// @param [scope]

function IotaSkipInterpolation()
{
    if (global.__iotaCurrentClock == undefined) __IotaError("Cannot use IotaSkipInterpolation() outside of a clock method");
    
    var _outName = argument[0];
    var _scope    = ((argument_count > 1) && (argument[1] != undefined))? argument[1] : self;
    
    global.__iotaCurrentClock.__VariableSkipInterpolation(_outName, _scope);
}