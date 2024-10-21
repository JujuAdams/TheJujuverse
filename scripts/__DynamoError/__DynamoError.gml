// Feather disable all

function __DynamoError()
{
    var _string = "";
    var _i = 0;
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    show_error("Dynamo:\n\n" + _string + "\n ", true);
}