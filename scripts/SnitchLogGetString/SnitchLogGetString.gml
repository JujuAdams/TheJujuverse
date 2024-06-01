// Feather disable all
/// @param index

function SnitchLogGetString(_index)
{
    static _logArray = __SnitchState().__logArray;
    
    if (_index == all)
    {
        var _string = "";
        
        var _i = 0;
        repeat(SNITCH_IN_GAME_LOG_SIZE)
        {
            _string += _logArray[_i] + "\n";
            ++_i;
        }
        
        _string = string_delete(_string, string_length(_string), 1);
        
        return _string;
    }
    
    return ((_index < 0) || (_index >= SNITCH_IN_GAME_LOG_SIZE))? "" : _logArray[_index];
}
