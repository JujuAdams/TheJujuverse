/// @desc    Returns the player’s gamepad’s type (after SDL remapping) as a string
/// @param   [playerIndex=0]
/// @param   [binding]

function input_player_get_gamepad_type(_player_index = 0, _binding = undefined)
{
    __INPUT_VERIFY_PLAYER_INDEX
    
    //If we're not in multidevice mode then ignore the binding argument
    if (global.__input_source_mode == INPUT_SOURCE_MODE.MULTIDEVICE)
    {
        _binding = undefined;
    }
    
    if (_binding != undefined)
    {
        if (!input_value_is_binding(_binding))
        {
            __input_error("Parameter is not a binding (typeof=", typeof(_binding), ")");
            return;
        }
        
        var _gamepad_index = _binding.__gamepad_get();
        if (_gamepad_index == undefined)
        {
            //Generic binding, return the player's gamepad
            _binding = undefined;
        }
        else
        {
            return input_gamepad_get_type(_gamepad_index);
        }
    }
    
    if (_binding == undefined)
    {
        return input_gamepad_get_type(input_player_get_gamepad(_player_index));
    }
}