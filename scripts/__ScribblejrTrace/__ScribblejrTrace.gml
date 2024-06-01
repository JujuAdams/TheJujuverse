// Feather disable all

/// @param value

function __ScribblejrTrace()
{
    var _string = "Scribblejr: ";
    
    var _i = 0;
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    SCRIBBLEJR_SHOW_DEBUG_MESSAGE(_string);
}