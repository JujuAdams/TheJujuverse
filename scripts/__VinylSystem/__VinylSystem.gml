#macro __VINYL_VERSION  "5.3.1"
#macro __VINYL_DATE     "2023-04-18"

#macro __VINYL_DATA_BUNDLE_FILENAME  "vinyl.dat"
#macro __VINYL_CONFIG_NOTE_NAME      "__VinylConfig"

#macro __VINYL_USE_GAIN_CURVE  true

#macro __VINYL_FALLOFF_MODEL  audio_falloff_exponent_distance_scaled

#macro __VINYL_RETURN_SELF_TO_POOL  if (__pool != undefined) { __pool.__Return(self) }


__VinylInitialize();

function __VinylInitialize()
{
    static _initialized = false;
    if (_initialized) return;
    _initialized = true;
    
    __VinylTrace("Welcome to Vinyl! This is version ", __VINYL_VERSION, ", ", __VINYL_DATE);
    
    __VinylValidateMacros();
    
    var _globalData = __VinylGlobalData();
    if (VINYL_DEBUG_LEVEL > 0) global.__vinylGlobalData = _globalData;
    
    _globalData.__poolAsset.__Populate(VINYL_POOL_START_SIZE);
    _globalData.__poolBasic.__Populate(VINYL_POOL_START_SIZE);
    _globalData.__poolQueue.__Populate(VINYL_POOL_START_SIZE);
    _globalData.__poolMulti.__Populate(VINYL_POOL_START_SIZE);
    _globalData.__poolEmitter.__Populate(VINYL_POOL_START_SIZE);
    _globalData.__poolPanEmitter.__Populate(VINYL_POOL_START_SIZE);
    
    if (!file_exists(__VINYL_DATA_BUNDLE_FILENAME))
    {
        __VinylError("Could not find \"", __VINYL_DATA_BUNDLE_FILENAME, "\"\n- Ensure that \"", __VINYL_DATA_BUNDLE_FILENAME, "\" has been added to your project's Included Files");
        return;
    }
    
    //Set up default behaviours within GM's audio system
    audio_falloff_set_model(__VINYL_FALLOFF_MODEL);
    audio_listener_set_orientation(VINYL_LISTENER_INDEX,   0, 0, 1,   0, -1, 0);
    audio_listener_set_position(VINYL_LISTENER_INDEX,   0, 0, 0);
    
    VinylSystemGainSet(1);
    __VinylEffectChainEnsure("main");
    __VinylUpdateData();
    
    if (__VinylGetLiveUpdateEnabled())
    {
        time_source_start(time_source_create(time_source_global, VINYL_LIVE_UPDATE_PERIOD/1000, time_source_units_seconds, __VinylUpdateData, [], -1));
    }
    else if (GM_build_type == "run")
    {
        __VinylTrace("Live update *not* enabled (VINYL_LIVE_UPDATE_PERIOD=", VINYL_LIVE_UPDATE_PERIOD, ")");
    }
    
    time_source_start(time_source_create(time_source_global, 1, time_source_units_frames, __VinylTick, [], -1));
}

function __VinylTrace()
{
    static _globalData = __VinylGlobalData();
    
    if (VINYL_DEBUG_SHOW_FRAMES)
    {
        var _string = "Vinyl fr." + string(_globalData.__frame) + ": ";
    }
    else
    {
        var _string = "Vinyl: ";
    }
    
    var _i = 0
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    show_debug_message(_string);
}

function __VinylError()
{
    var _string = "";
    
    var _i = 0
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    show_debug_message("Vinyl " + __VINYL_VERSION + ": " + string_replace_all(_string, "\n", "\n             "));
    show_error("Vinyl:\n" + _string + "\n ", true);
}

function __VinylGetLiveUpdateEnabled()
{
    static _result = undefined;
    if (_result == undefined)
    {
        _result = ((VINYL_LIVE_UPDATE_PERIOD > 0) && (GM_build_type == "run") && ((os_type == os_windows) || (os_type == os_macosx) || (os_type == os_linux)));
    }
    
    return _result;
}

function __VinylGetDatafilePath()
{
    static _result = undefined;
    if (_result == undefined)
    {
        if (__VinylGetLiveUpdateEnabled())
        {
            _result = filename_dir(GM_project_filename) + "/notes/" + __VINYL_CONFIG_NOTE_NAME + "/" + __VINYL_CONFIG_NOTE_NAME + ".txt";
        }
        else
        {
            _result = __VINYL_DATA_BUNDLE_FILENAME;
        }
    }
    
    return _result;
}