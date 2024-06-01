// Feather disable all

#macro __VINYL_VERSION  "6.0.6 (beta)"
#macro __VINYL_DATE     "2024-06-01"

#macro __VINYL_RUNNING_FROM_IDE  (GM_build_type == "run")

#macro __VINYL_DEFAULT_DUCK_RATE_OF_GAIN  1

//Whether to show the frame number in debug messages
#macro __VINYL_DEBUG_SHOW_FRAMES  false

enum __VINYL_HLT_STATE
{
    __HEAD,
    __LOOP,
    __TAIL,
}

enum VINYL_QUEUE
{
    DONT_LOOP,
    LOOP_EACH,
    LOOP_ON_LAST,
}

enum __VINYL_DUCK
{
    __DO_NOTHING,
    __STOP,
}

__VinylSystem();
function __VinylSystem()
{
    static _system = undefined;
    if (_system != undefined) return _system;
    _system = {};
    
    with(_system)
    {
        if (__VINYL_DEBUG_SHOW_FRAMES) __frame = 0;
        
        __VinylTrace("Welcome to Vinyl! This is version ", __VINYL_VERSION, ", ", __VINYL_DATE);
        if (__VINYL_RUNNING_FROM_IDE) global.Vinyl = self;
        
        __toUpdateArray = VINYL_LIVE_EDIT? [] : undefined;
        __importingJSON = false;
        
        //Lookup dictionaries for sound/pattern/mix definitions.
        __soundDict    = {};
        __patternDict  = {};
        __mixDict      = {};
        __metadataDict = {};
        
        __compiledSoundArray = [];
        
        //Array of mixes that need updating every frame
        __mixArray = [];
        
        //Maps that converts native GameMaker voice indexes to voice data structs. This is used
        //to efficiently find Vinyl's addition voice data using voice references. We use a map
        //instead of a struct because struct_remove_from_hash() doesn't exist yet and it's easier
        //to incrementally 
        __voiceToStructMap = ds_map_create();
        __voiceToStructLastKey = undefined;
        
        __voiceToSoundMap = ds_map_create();
        __voiceToSoundLastKey = undefined;
        
        //Contains structs that describe callbacks to be executed when a voice stops playing.
        __callbackArray = [];
        
        __duckerDict  = {};
        __duckerArray = [];
        
        //An array of voices that are in the lookup dictionary. This will never include HLT voices
        //as they are managed in the update array (see below). Blend voices will automatically be
        //put into this array. Sound voices will automatically be put into this array in Live Edit
        //mode or if some additional property needs to be attached to the voice e.g. fading out or
        //setting gain.
        
        //An array of voice structs that need to be actively managed. This will always include HLT
        //voices. Sound voices and Blend voices are added to the update array when a fade out
        //operation is called on them.
        __voiceUpdateArray = [];
        
        //Create a null voice struct that can be returned when we can't find a voice but need to
        //be able to call a method that fails silently.
        __nullVoice = {};
        with(__nullVoice)
        {
            __IsPlaying    = function() { return false; };
            __SetLocalGain = function() {};
            __FadeOut      = function() {};
            __SetMixGain   = function() {};
        }
        
        //Set the master gain to 1. The actual gain value we pass into GameMaker's native function
        //is some multiple of this value so we want to initialize early to ensure the native gain
        //is set properly for unity gain.
        VinylMasterSetGain(1);
        
        //Build sound patterns for every single sound in the project. This saves extra work later.
        var _defaultMix = (VINYL_DEFAULT_MIX == VINYL_NO_MIX)? undefined : VINYL_DEFAULT_MIX;
        var _soundDict = __soundDict;
        var _assetArray = asset_get_ids(asset_sound);
        var _i = 0;
        repeat(array_length(_assetArray))
        {
            var _sound = _assetArray[_i];
            struct_set_from_hash(_soundDict, int64(_sound), new __VinylClassPatternSound(_sound, 1, 1, undefined, _defaultMix));
            ++_i;
        }
        
        //Import the boot setup JSON
        __VinylConfigJSON();
        __VinylSetupImportJSONInner(global.VinylConfigSON);
        
        //Set up an update function that executes one every frame forever.
        time_source_start(time_source_create(time_source_global, 1, time_source_units_frames, function()
        {
            static _voiceToSoundMap  = __voiceToSoundMap;
            static _voiceToStructMap = __voiceToStructMap;
            static _callbackArray    = __callbackArray;
            static _bootSetupTimer   = 0;
            static _bootSetupPath    = VINYL_LIVE_EDIT? filename_dir(GM_project_filename) + "/scripts/__VinylConfigJSON/__VinylConfigJSON.gml" : undefined;
            static _bootSetupHash    = undefined;
            
            if (__VINYL_DEBUG_SHOW_FRAMES) __frame++;
            
            var _usPerFrame = game_get_speed(gamespeed_microseconds);
            if (delta_time > 10*_usPerFrame)
            {
                //Game hung, revert to fixed step size
                var _deltaTimeFactor = _usPerFrame / 1000000;
            }
            else
            {
                //Game running within generous acceptable parameters, delta time as normal
                var _deltaTimeFactor = (clamp(delta_time, _usPerFrame/3, 3*_usPerFrame) / 1000000);
            }
            
            //Handle live update from boot setup JSON
            if (VINYL_LIVE_EDIT && ((os_type == os_windows) || (os_type == os_macosx) || (os_type == os_linux)))
            {
                --_bootSetupTimer;
                if (_bootSetupTimer <= 0)
                {
                    _bootSetupTimer = 60;
                    
                    var _newHash = md5_file(_bootSetupPath);
                    if (_newHash != _bootSetupHash)
                    {
                        if (_bootSetupHash == undefined)
                        {
                            _bootSetupHash = _newHash;
                        }
                        else
                        {
                            _bootSetupHash = _newHash;
                            
                            var _buffer = buffer_load(_bootSetupPath);
                            
                            var _gml = undefined;
                            try
                            {
                                var _gml = __VinylBufferReadGML(_buffer, 0, buffer_get_size(_buffer));
                            }
                            catch(_error)
                            {
                                show_debug_message(json_stringify(_error, true));
                                __VinylTrace("Warning! Failed to read GML");
                            }
                            
                            buffer_delete(_buffer);
                            
                            if (is_struct(_gml))
                            {
                                try
                                {
                                    VinylSetupImportJSON(_gml[$ "global.VinylConfigSON"] ?? []);
                                    __VinylTrace("Successfully loaded config JSON from disk (", date_datetime_string(date_current_datetime()), ")");
                                }
                                catch(_error)
                                {
                                    show_debug_message(json_stringify(_error, true));
                                    __VinylTrace("Warning! Failed to import JSON");
                                }
                            }
                        }
                    }
                }
            }
            
            //Update duckers
            var _array = __duckerArray;
            var _i = 0;
            repeat(array_length(_array))
            {
                _array[_i].__Update();
                ++_i;
            }
            
            //Update voices that need it
            var _array = __voiceUpdateArray;
            var _i = 0;
            repeat(array_length(_array))
            {
                if (not _array[_i].__Update(_deltaTimeFactor))
                {
                    array_delete(_array, _i, 1);
                }
                else
                {
                    ++_i;
                }
            }
            
            //Update mixes
            var _array = __mixArray;
            var _i = 0;
            repeat(array_length(_array))
            {
                _array[_i].__Update(_deltaTimeFactor);
                ++_i;
            }
            
            //Clean up ds_maps
            var _voice = (__voiceToStructLastKey == undefined)? ds_map_find_first(_voiceToSoundMap) : ds_map_find_next(_voiceToSoundMap, __voiceToStructLastKey);
            __voiceToStructLastKey = _voice;
            
            if ((_voice != undefined) && (not audio_is_playing(_voice)))
            {
                ds_map_delete(_voiceToSoundMap, _voice);
            }
            
            var _voice = (__voiceToSoundLastKey == undefined)? ds_map_find_first(_voiceToStructMap) : ds_map_find_next(_voiceToStructMap, __voiceToSoundLastKey);
            __voiceToSoundLastKey = _voice;
            
            var _voice = ds_map_find_first(_voiceToStructMap);
            if ((_voice != undefined) && (not _voiceToStructMap[? _voice].__IsPlaying()))
            {
                ds_map_delete(_voiceToStructMap, _voice);
            }
            
            //Check for callback execution
            var _i = 0;
            repeat(array_length(_callbackArray))
            {
                if (not _callbackArray[_i].__IsPlaying())
                {
                    var _callbackData = _callbackArray[_i];
                    _callbackData.__method(_callbackData.__metadata);
                }
                
                ++_i;
            }
        }, [], -1));
    }
    
    return _system;
}