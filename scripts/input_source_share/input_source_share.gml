/// @desc    Assigns a source to two or more players. All other players using the source will have it unassigned
///          If the players had any other sources assigned then they will be unassigned
/// @param   source
/// @param   arrayOfPlayerIndexes
/// @param   [autoProfile=true]

function input_source_share(_source, _array, _auto_profile = true)
{
	__input_initialize();
    __INPUT_VERIFY_SOURCE
    __INPUT_VERIFY_SOURCE_ASSIGNABLE
    
    __input_source_relinquish(_source);
    
    var _i = 0;
    repeat(array_length(_array))
    {
        var _player_index = _array[_i];
        __INPUT_VERIFY_PLAYER_INDEX
        
        with(global.__input_players[_player_index])
        {
            __sources_clear();
            __source_add(_source);
            if (_auto_profile) __profile_set_auto();
        }
        
        ++_i;
    }
}