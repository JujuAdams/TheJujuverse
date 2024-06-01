// Feather disable all

function __VinylWarning()
{
    static _system = __VinylSystem();
    
    if (__VINYL_DEBUG_SHOW_FRAMES)
    {
        var _string = "Vinyl fr." + string(_system.__frame) + ": Warning! ";
    }
    else
    {
        var _string = "Vinyl: Warning! ";
    }
    
    var _i = 0
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    _string += "          " + string(debug_get_callstack());
    
    show_debug_message(_string);
}