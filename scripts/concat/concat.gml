/// Returns a string made from the concatenated stringified arguments passed to the function
/// 
/// @param value

function concat()
{
    var _string = "";
    
    var _i = 0;
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    return _string;
}
