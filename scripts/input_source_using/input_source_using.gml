/// @desc    Returns if the player is using the given source. If INPUT_GAMEPAD is used without
///          specifying a particular gamepad then this function will reutnr <true> if any gamepad
///          is being used by the payer
/// @param   source
/// @param   [playerIndex=0]

function input_source_using(_source, _player_index = 0)
{
	__input_initialize();
    __INPUT_VERIFY_PLAYER_INDEX
    
    return global.__input_players[_player_index].__source_contains(_source);
}