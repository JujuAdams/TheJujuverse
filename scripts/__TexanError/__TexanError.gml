// Feather disable all

function __TexanError()
{
    var _string = "";
    var _i = 0;
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    show_error("Texan:\n" + _string + "\n ", true);
}