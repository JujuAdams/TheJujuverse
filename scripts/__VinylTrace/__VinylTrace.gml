// Feather disable all

function __VinylTrace()
{
    static _system = __VinylSystem();
    
    if (__VINYL_DEBUG_SHOW_FRAMES)
    {
        var _string = "Vinyl fr." + string(_system.__frame) + ": ";
    }
    else
    {
        var _string = "Vinyl: ";
    }
    
    var _i = 0
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    show_debug_message(_string);
}