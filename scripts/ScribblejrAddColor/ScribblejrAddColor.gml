// Feather disable all

/// Adds a colour that Scribble Jr. will recognise when used in formatting tags in strings drawn by
/// the Scribblejr*Ext() functions. Colours should be provided in GameMaker's standard 24-bit BGR
/// format. Colour names are case sensitive. If you specify a negative number then Scribble Jr.
/// will interpret this as a colour reset command.
/// 
/// @param name
/// @param color

function ScribblejrAddColor(_name, _color)
{
    static _colourDict = __ScribblejrSystem().__colourDict;
    _colourDict[$ _name] = _color;
}