// Feather disable all
//Initialize the library
__SnitchInitialize();

function __SnitchInitialize()
{
    //Don't initialize twices
    static _initialized = false;
    if (_initialized) return;
    _initialized = true;
    
    if ((SNITCH_SERVICE_MODE != 0) && !SNITCH_SERVICE_WARNING_READ)
    {
        __SnitchError("Bug tracking services open up potential privacy and security risks.\n1. Never share access keys with anyone\n2. Use .gitignore to ignore __SnitchConfigServiceKeys.gml if hosting your work publicly\n3. Do your absolute best to protect the privacy of your players\n \nPlease set SNITCH_SERVICE_WARNING_READ to <true> to acknowledge this warning");
        game_end();
        return;
    }
    
    with(__SnitchState())
    {
        var _oldTimezone = date_get_timezone();
        date_set_timezone(timezone_utc);  __SessionBootTime = date_current_datetime();
        date_set_timezone(_oldTimezone);
    
        __GMExceptionHandler = undefined;
        __Frames             = 0;
        __SessionStartTime   = current_time;
        __SessionID          = SnitchGenerateUUID4String(true);
        __FocusFrames        = 0;
        __FocusTime          = 0;
    
        __CrashCapture       = false;
        __LogToFileEnabled   = false;
        __ServiceEnabled     = false;
    
        //Determine how the application is being run and whether we should capture crashes
        __RunningFromIDE = (GM_build_type == "run");
        __CrashCapture   = __RunningFromIDE? SNITCH_CRASH_CAPTURE_FROM_IDE : SNITCH_CRASH_CAPTURE_COMPILED;
    
        //Log files
        __logArray           = array_create(SNITCH_IN_GAME_LOG_SIZE, "");
        __WroteLogFileHeader = false;
        __ZerothLogFile      = string_replace(SNITCH_LOG_FILENAME, "#", "0");
        __LogFileBuffer      = buffer_create(SNITCH_LOG_BUFFER_START_SIZE, buffer_grow, 1);
    
        //Network transmission
        __NetworkConnected          = false;
        __NetworkSocket             = undefined;
        __NetworkEnabled            = false;
        __NetworkOutgoingPort       = SNITCH_NETWORK_DEFAULT_OUTGOING_PORT;
        __NetworkTargetPort         = SNITCH_NETWORK_DEFAULT_RECEIVER_PORT;
        __NetworkTargetIP           = SNITCH_NETWORK_DEFAULT_RECEIVER_IP;
        __NetworkConnectionAttempts = 0;
        __NetworkAbandoned          = false;
        __NetworkPendingMessages    = [];
    
        //HTTP-related tracking
        __HTTPHeaderMap            = ds_map_create(); //Has to be a map due to GameMaker's HTTP request API
        __HTTPRequests             = {};
        __RequestBackups           = {};
        __RequestBackupOrder       = [];
        __RequestBackupResendTime  = -SNITCH_REQUEST_BACKUP_RESEND_DELAY; //Try to send a request backup immediately on boot
        __RequestBackupResendIndex = 0;
        __RequestBackupFailures    = 0;
    
        //Service-specific
        __GAPlatform  = "";
        __GAOSVersion = "";
        __GAGameMakerVersion = "gamemaker " + string_delete(string_delete(GM_runtime_version, 5, 1), 1, 3);
        
        //Breadcrumbs
        __sentryBreadcrumbArray = [];
        
        
        
        //Build an array for the boot parameters
        SNITCH_BOOT_PARAMETERS = [];
        var _i = 0;
        repeat(parameter_count())
        {
            array_push(SNITCH_BOOT_PARAMETERS,  parameter_string(_i));
            ++_i;
        }
    
        if (SNITCH_NETWORK_MODE == 2) network_set_config(network_config_connect_timeout, SNITCH_NETWORK_CONNECTION_TIMEOUT);
    
    
    
        #region Set SNITCH_OS_NAME, SNITCH_OS_VERSION, SNITCH_ENVIRONMENT_NAME, SNITCH_BROWSER, __OSInfo
        
        __OSName    = "Unknown (=" + string(os_type) + ")";
        __OSVersion = "v" + string(os_version);
        __Browser           = "Unknown browser";
        __EnvironmentName  = __OSName + " " + __OSVersion;
    
        switch(os_type)
        {
            case os_windows:
            case os_win8native:
                __OSName     = "Windows";
                __GAPlatform = "windows";
              
                switch(os_version)
                {
                    case 327680: __OSVersion = "2000";  __GAPlatform = __GAPlatform + " 5.0"  break;
                    case 327681: __OSVersion = "XP";    __GAPlatform = __GAPlatform + " 5.1"; break;
                    case 237862: __OSVersion = "XP";    __GAPlatform = __GAPlatform + " 5.2"; break;
                    case 393216: __OSVersion = "Vista"; __GAPlatform = __GAPlatform + " 6";   break;
                    case 393217: __OSVersion = "7";     __GAPlatform = __GAPlatform + " 7";   break;
                    case 393218: __OSVersion = "8";     __GAPlatform = __GAPlatform + " 8";   break;
                    case 393219: __OSVersion = "8.1";   __GAPlatform = __GAPlatform + " 8.1"; break;
                    case 655360: __OSVersion = "10";    __GAPlatform = __GAPlatform + " 10";  break;
                }
            break;
        
            case os_uwp:
                __OSName    = "UWP";
                __OSVersion = string(os_version);
            
                __GAPlatform  = "uwp_console"; //Dunno how to detect whether we're on console or not
                __GAOSVersion = __GAPlatform + " " + string(os_version);
            break;
        
            case os_linux:
                __OSName    = "Linux";
                __OSVersion = string(os_version);
            
                __GAPlatform  = "linux";
                __GAOSVersion = __GAPlatform + " " + string(os_version);
            break;
        
            case os_macosx:
                __OSName    = "macOS";
                __OSVersion = string(os_version >> 24) + "." + string((os_version >> 12) & 0xfff);
            
                __GAPlatform  = "mac_osx";
                __GAOSVersion = __GAPlatform + " " + string(os_version);
            break;
        
            case os_ios:
                __OSName    = "iOS";
                __OSVersion = string(os_version >> 24) + "." + string((os_version >> 12) & 0xfff);
            
                __GAPlatform  = "ios";
                __GAOSVersion = __GAPlatform + " " + string(os_version);
            break;
        
            case os_android:
                __OSName = "Android";
            
                switch(os_version)
                {
                    case 21: __OSVersion = "Lollipop";    break;
                    case 22: __OSVersion = "Lollipop";    break;
                    case 23: __OSVersion = "Marshmallow"; break;
                    case 24: __OSVersion = "Nougat";      break;
                    case 25: __OSVersion = "Oreo";        break;
                    case 26: __OSVersion = "Pie";         break;
                
                    default:
                        if (os_version >= 27)
                        {
                            __OSVersion = "v" + string(os_version - 17);
                        }
                    break;
                }
            
                __GAPlatform  = "android";
                __GAOSVersion = __GAPlatform + " " + string(os_version);
            break;
        
            case os_tvos:         __OSName = "tvOS";             __GAPlatform = "tvos";    __GAOSVersion = __GAPlatform; break;
            case os_ps3:          __OSName = "PlayStation 3";    __GAPlatform = "ps3";     __GAOSVersion = __GAPlatform; break;
            case os_ps4:          __OSName = "PlayStation 4";    __GAPlatform = "ps4";     __GAOSVersion = __GAPlatform; break;
            case os_ps5:          __OSName = "PlayStation 5";    __GAPlatform = "psm";     __GAOSVersion = __GAPlatform; break; //No PS5
            case os_psvita:       __OSName = "PlayStation Vita"; __GAPlatform = "vita";    __GAOSVersion = __GAPlatform; break;
            case os_xboxone:      __OSName = "Xbox One";         __GAPlatform = "xboxone"; __GAOSVersion = __GAPlatform; break;
            case os_xboxseriesxs: __OSName = "Xbox Series X/S";  __GAPlatform = "xboxone"; __GAOSVersion = __GAPlatform; break; //No Xbox Series X/S
            case os_switch:       __OSName = "Switch";           __GAPlatform = "wiiu";    __GAOSVersion = __GAPlatform; break; //No Switch OS
            case os_operagx:      __OSName = "GX.games";         __GAPlatform = "windows"; __GAOSVersion = __GAPlatform; break; //No idea how to deal with this
        }
    
        //Figure out what browser we're using
        switch(os_browser)
        {
            case browser_not_a_browser: __Browser = "Not a browser";     break;
            case browser_ie:            __Browser = "Internet Explorer"; break;
            case browser_ie_mobile:     __Browser = "Internet Explorer"; break;
            case browser_firefox:       __Browser = "Firefox";           break;
            case browser_chrome:        __Browser = "Chrome";            break;
            case browser_safari:        __Browser = "Safari";            break;
            case browser_safari_mobile: __Browser = "Safari";            break;
            case browser_opera:         __Browser = "Opera";             break;
        }
    
        //If we're on a browser, use the browser's name instead
        if (os_browser == browser_not_a_browser)
        {
            __EnvironmentName = __OSName + " " + __OSVersion;
        }
        else
        {
            __EnvironmentName = __Browser;
        }
    
        //Turn the os_get_info() map into a struct for serialization
        __OSInfo = {};
        if (os_type != os_switch) //TODO - Workaround for a crash on Switch (runtime 2.3.6   2022-02-04)
        {
            var _infoMap = os_get_info();
        
            var _key = ds_map_find_first(_infoMap);
            repeat(ds_map_size(_infoMap))
            {
                __OSInfo[$ _key] = _infoMap[? _key];
                _key = ds_map_find_next(_infoMap, _key);
            }
        
            ds_map_destroy(_infoMap);
        }
    
        #endregion
    
    
    
        if (SNITCH_LOG_ON_BOOT) SnitchLogSet(true);
        if (SNITCH_NETWORK_ON_BOOT) SnitchNetworkSet(true);
        __SnitchTrace("Welcome to Snitch by @jujuadams! This is version " + string(SNITCH_VERSION) + ", " + string(SNITCH_DATE));
        __SnitchTrace("Running ", __RunningFromIDE? "from IDE" : "compiled executable", ", crash capture turned ", __CrashCapture? "on" : "off");
    
    
    
        if (__CrashCapture)
        {
            __exception_unhandled_handler__(__SnitchExceptionHandler);
        }
    
        if (SNITCH_REQUEST_BACKUP_COUNT < 1)
        {
            __SnitchError("SNITCH_REQUEST_BACKUP_COUNT must be greater than zero");
        }
    
        if (SNITCH_ALLOW_LOG_BOOT_PARAMETER && (os_type == os_windows))
        {
            var _i = 0;
            repeat(parameter_count())
            {
                if (parameter_string(_i) == "-log")
                {
                    SnitchLogSet(true);
                    if (SnitchLogGet() && (SNITCH_LOG_BOOT_PARAMETER_CONFIRMATION != "")) show_message(SNITCH_LOG_BOOT_PARAMETER_CONFIRMATION);
                    break;
                }
            
                _i++;
            }
        }
    
    
    
        if (SNITCH_REQUEST_BACKUP_ENABLE && (SNITCH_SERVICE_MODE > 0))
        {
            var _loadedManifest = false;
            try
            {
                var _buffer = buffer_load(SNITCH_REQUEST_BACKUP_MANIFEST_FILENAME);
                _loadedManifest = true;
            
                var _json = buffer_read(_buffer, buffer_string);
                __RequestBackupOrder = json_parse(_json);
            
                if (!is_array(__RequestBackupOrder)) throw "Not an array";
            }
            catch(_error)
            {
                if (!_loadedManifest)
                {
                    __SnitchTrace("Could not find request backup manifest");
                }
                else
                {
                    __SnitchTrace("Request backup manifest was corrupted");
                }
            
                __RequestBackupOrder = [];
            }
            finally
            {
                if (_loadedManifest) buffer_delete(_buffer);
            }
        
            if (_loadedManifest)
            {
                var _expected = array_length(__RequestBackupOrder);
                var _missing = 0;
            
                var _i = _expected - 1;
                repeat(_expected)
                {
                    var _uuid = __RequestBackupOrder[_i];
                
                    var _filename = __SnitchRequestBackupFilename(_uuid);
                    if (!file_exists(_filename))
                    {
                        _missing++;
                        array_delete(__RequestBackupOrder, _i, 1);
                    }
                    else
                    {
                        var _buffer = buffer_load(_filename);
                    
                        if (buffer_get_size(_buffer) <= 0)
                        {
                            //If the buffer is empty, delete the file on disk and report this event as missing
                            _missing++;
                            file_delete(_filename);
                        }
                        else
                        {
                            //Otherwise read out a string from the buffer and create a new request
                            var _request = new __SnitchClassRequest(_uuid, buffer_read(_buffer, buffer_text));
                            _request.savedBackup = true;
                            __RequestBackups[$ _uuid] = _request;
                        }
                    
                        buffer_delete(_buffer);
                    }
                
                    --_i;
                }
            
                __SnitchTrace("Found ", array_length(__RequestBackupOrder), " request backups (", _expected, " in manifest, of which ", _missing, " were missing)");
            }
        
            __SnitchRequestBackupSaveManifest();
        }
    
    
        if (SNITCH_SERVICE_MODE > 0)
        {
            //Force a network connection if possible
            os_is_network_connected(true);
        }
    
        switch(SNITCH_SERVICE_MODE)
        {
            //sentry.io
            case 1:
                var _DSN = SNITCH_SENTRY_DSN_URL;
            
                var _protocolPosition = string_pos("://", _DSN);
                if (_protocolPosition == 0) __SnitchError("No protocol found in DSN string");
                var _protocol = string_copy(_DSN, 1, _protocolPosition-1);
            
                var _atPosition = string_pos("@", _DSN);
                if (_atPosition == 0) __SnitchError("No @ found in DSN string");
            
                __SentryPublicKey = string_copy(_DSN, _protocolPosition + 3, _atPosition - (_protocolPosition + 3));
                if (__SentryPublicKey == "") __SnitchError("No public key found in DSN string");
            
                var _slashPosition = string_last_pos("/", _DSN);
            
                var _DSNHostPath = string_copy(_DSN, _atPosition + 1, _slashPosition - (_atPosition + 1));
                if (_DSNHostPath == "") __SnitchError("No host/path found in DSN string");
            
                var _DSNProject = string_copy(_DSN, _slashPosition + 1, string_length(_DSN) - _slashPosition);
                if (_DSNProject == "") __SnitchError("No project found in DSN string");
            
                __Endpoint = _protocol + "://" + _DSNHostPath + "/api/" + _DSNProject + "/store/";
            
                //Build an auth string for later HTTP requests
                //We fill in the timestamp later when sending the request
                __SentryAuthString = "Sentry sentry_version=7, sentry_client=Snitch/" + string(SNITCH_VERSION) + ", sentry_key=" + __SentryPublicKey + ", sentry_timestamp=";
            break;
        
            //GameAnalytics
            case 2:
                if ((SNITCH_GAMEANALYTICS_GAME_KEY == "5c6bcb5402204249437fb5a7a80a4959") && (SNITCH_GAMEANALYTICS_SECRET_KEY == "16813a12f718bc5c620f56944e1abc3ea13ccbac"))
                {
                    __SnitchTrace("Using GameAnalytics' sandbox endpoint");
                    __Endpoint = "https://sandbox-api.gameanalytics.com/v2/" + SNITCH_GAMEANALYTICS_GAME_KEY + "/events";
                }
                else
                {
                    __Endpoint = "https://api.gameanalytics.com/v2/" + SNITCH_GAMEANALYTICS_GAME_KEY + "/events";
                }
            break;
        
            //Bugsnag
            case 3:
            break;
        
            //Generic
            case 4:
            break;
        }
    
        if (SNITCH_SERVICE_ON_BOOT) SnitchServiceSet(true);
    
    
    
        //Ensure our controller instance always sticks around
        time_source_start(time_source_create(time_source_global, 1, time_source_units_frames, function()
        {
            if (!instance_exists(__SnitchController))
            {
                instance_activate_object(__SnitchController);
            
                if (instance_exists(__SnitchController))
                {
                    __SnitchError("__SnitchContoller has been deactivated\nPlease ensure that __SnitchContoller is never deactivated");
                }
                else
                {
                    instance_create_depth(0, 0, 0, __SnitchController);
                }
            }
        }, [], -1));
    }
}
