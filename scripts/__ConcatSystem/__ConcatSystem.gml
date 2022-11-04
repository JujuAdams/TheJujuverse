#macro __CONCAT_VERSION  "1.0.0"
#macro __CONCAT_DATE     "2022-04-25"

__ConcatTrace("Welcome to Concat by @jujuadams! This is version ", __CONCAT_VERSION, ", ", __CONCAT_DATE);

function __ConcatTrace()
{
    var _string = "Concat: ";
    
    var _i = 0;
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    show_debug_message(_string);
}
