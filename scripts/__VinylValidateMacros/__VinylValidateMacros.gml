function __VinylValidateMacros()
{
    if not (is_numeric(VINYL_LIVE_UPDATE_PERIOD))
    {
        __VinylError("VINYL_LIVE_UPDATE_PERIOD must be a number");
    }
    
    if not (is_numeric(VINYL_STEP_DURATION) && (VINYL_STEP_DURATION >= 0))
    {
        __VinylError("VINYL_STEP_DURATION must be a number greater than or equal to zero");
    }
    
    if not (is_numeric(VINYL_DEFAULT_GAIN_RATE) && (VINYL_DEFAULT_GAIN_RATE > 0))
    {
        __VinylError("VINYL_DEFAULT_GAIN_RATE must be a number greater than zero");
    }
    
    if not (is_numeric(VINYL_DEFAULT_PITCH_RATE) && (VINYL_DEFAULT_PITCH_RATE > 0))
    {
        __VinylError("VINYL_DEFAULT_PITCH_RATE must be a number greater than zero");
    }
    
    if not (is_bool(VINYL_DEBUG_READ_CONFIG))
    {
        __VinylError("VINYL_DEBUG_READ_CONFIG must be a boolean (either <true> or <false>)");
    }
    
    if not (is_numeric(VINYL_DEBUG_LEVEL))
    {
        __VinylError("VINYL_DEBUG_LEVEL must be a number");
    }
    
    if not (is_numeric(VINYL_MAX_GAIN))
    {
        __VinylError("VINYL_MAX_GAIN must be a number");
    }
}