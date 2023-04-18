/// @desc    Returns how long the current verb was held when released, the units of which is determined by INPUT_TIMER_MILLISECONDS
///          This function returns a value less than 0 if the verb is not active or was not released
/// @param   verb/array
/// @param   [playerIndex=0]

function input_held_time_released(_verb, _player_index = 0)
{
    __INPUT_VERIFY_PLAYER_INDEX
    __INPUT_GET_VERB_STRUCT
    
    //Return a negative number if the verb is inactive, cleared, not released
    if (_verb_struct.__inactive || global.__input_cleared || !_verb_struct.release) return -1;
    
    return max(0, (INPUT_TIMER_MILLISECONDS? global.__input_previous_current_time : global.__input_frame - 1) - _verb_struct.press_time);
}
