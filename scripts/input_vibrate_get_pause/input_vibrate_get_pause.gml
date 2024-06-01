// Feather disable all
/// @desc    Returns whether vibration has been paused for the given player
/// 
/// @param   [playerIndex=0]

function input_vibrate_get_pause(_player_index = 0)
{
    __INPUT_GLOBAL_STATIC_LOCAL  //Set static _global
    __INPUT_VERIFY_PLAYER_INDEX
    
    return _global.__players[_player_index].__vibration_paused;
}
