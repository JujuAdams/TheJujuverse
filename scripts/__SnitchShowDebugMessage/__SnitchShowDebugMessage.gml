// Feather disable all
/// @param string

function __SnitchShowDebugMessage(_string)
{
    static _logArray = __SnitchState().__logArray;
    
    array_insert(_logArray, 0, _string);
    array_delete(_logArray, SNITCH_IN_GAME_LOG_SIZE-1, 1);
    
    show_debug_message(_string);
}
