// Feather disable all

/// Returns the colour defined for the given name. If the colour cannot be found then this function
/// returns <undefined>.
/// 
/// @param name

function ScribblejrGetColor(_name)
{
    static _colourDict = __ScribblejrSystem().__colourDict;
    return _colourDict[$ _name];
}