// Feather disable all
function __SnitchError()
{
    var _string = "";
    var _i = 0;
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    show_error("Snitch " + SNITCH_VERSION + ":\n" + _string + "\n ", true);
}
