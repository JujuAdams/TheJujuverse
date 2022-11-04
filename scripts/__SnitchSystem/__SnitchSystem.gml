// Log4j - https://logging.apache.org/log4j/2.x/manual/layouts.html

#macro SNITCH_VERSION               "3.1.0"
#macro SNITCH_DATE                  "2022-11-02"
#macro SNITCH_OS_NAME               global.__snitchOSName
#macro SNITCH_OS_VERSION            global.__snitchOSVersion
#macro SNITCH_ENVIRONMENT_NAME      global.__snitchEnvironmentName
#macro SNITCH_BROWSER               global.__snitchBrowser
#macro SNITCH_OS_INFO               global.__snitchOSInfo
#macro SNITCH_BOOT_PARAMETERS       global.__snitchBootParameters
#macro SNITCH_SESSION_ID            global.__snitchSessionID
#macro SNITCH_RUNNING_FROM_IDE      global.__snitchRunningFromIDE
#macro SNITCH_SESSION_START_TIME    global.__snitchSessionBootTime
#macro SNITCH_FRAMES                global.__snitchFrames
#macro SNITCH_FOCUS_FRAMES          global.__snitchFocusFrames
#macro SNITCH_SESSION_TIME          (current_time - global.__snitchSessionStartTime)
#macro SNITCH_FOCUS_TIME            global.__snitchFocusTime
#macro SNITCH_GA_PLATFORM           global.__snitchGAPlatform
#macro SNITCH_GA_OS_VERSION         global.__snitchGAOSVersion
#macro SNITCH_GA_GAMEMAKER_VERSION  global.__snitchGAGameMakerVersion

#macro __SNITCH_DEBUG  (global.__snitchRunningFromIDE && true)
#macro __SNITCH_HTTP_TEST_TIMEOUT  5000



//Initialize the library
__SnitchInit();

function __SnitchInit()
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
    
    var _oldTimezone = date_get_timezone();
    date_set_timezone(timezone_utc);
    global.__snitchSessionBootTime = date_current_datetime();
    date_set_timezone(_oldTimezone);
    
    global.__snitchGMExceptionHandler = undefined;
    global.__snitchFrames             = 0;
    global.__snitchSessionStartTime   = current_time;
    global.__snitchFocusFrames        = 0;
    global.__snitchFocusTime          = 0;
    
    global.__snitchCrashCapture       = false;
    global.__snitchLogToFileEnabled   = false;
    global.__snitchServiceEnabled = false;
    
    //Determine how the application is being run and whether we should capture crashes
    global.__snitchRunningFromIDE = (GM_build_type == "run");
    global.__snitchCrashCapture   = global.__snitchRunningFromIDE? SNITCH_CRASH_CAPTURE_FROM_IDE : SNITCH_CRASH_CAPTURE_COMPILED;
    
    //Log files
    global.__snitchWroteLogFileHeader = false;
    global.__snitchZerothLogFile      = string_replace(SNITCH_LOG_FILENAME, "#", "0");
    global.__snitchLogFileBuffer      = buffer_create(SNITCH_LOG_BUFFER_START_SIZE, buffer_grow, 1);
    
    //Network transmission
    global.__snitchNetworkConnected          = false;
    global.__snitchNetworkSocket             = undefined;
    global.__snitchNetworkEnabled            = false;
    global.__snitchNetworkOutgoingPort       = SNITCH_NETWORK_DEFAULT_OUTGOING_PORT;
    global.__snitchNetworkTargetPort         = SNITCH_NETWORK_DEFAULT_RECEIVER_PORT;
    global.__snitchNetworkTargetIP           = SNITCH_NETWORK_DEFAULT_RECEIVER_IP;
    global.__snitchNetworkTestTime           = undefined;
    global.__snitchNetworkTested             = false;
    global.__snitchNetworkConnectionAttempts = 0;
    global.__snitchNetworkAbandoned          = false;
    global.__snitchNetworkPendingMessages    = [];
    
    //HTTP-related tracking
    global.__snitchHTTPTestTime             = undefined;
    global.__snitchHTTPHeaderMap            = ds_map_create(); //Has to be a map due to GameMaker's HTTP request API
    global.__snitchHTTPRequests             = {};
    global.__snitchRequestBackups           = {};
    global.__snitchRequestBackupOrder       = [];
    global.__snitchRequestBackupResendTime  = -SNITCH_REQUEST_BACKUP_RESEND_DELAY; //Try to send a request backup immediately on boot
    global.__snitchRequestBackupResendIndex = 0;
    global.__snitchRequestBackupFailures    = 0;
    
    //Service-specific
    global.__snitchGAPlatform  = "";
    global.__snitchGAOSVersion = "";
    global.__snitchGAGameMakerVersion = "gamemaker " + string_delete(string_delete(GM_runtime_version, 5, 1), 1, 3);
    
    
    
    //Build an array for the boot parameters
    SNITCH_BOOT_PARAMETERS = [];
    var _i = 0;
    repeat(parameter_count())
    {
        array_push(SNITCH_BOOT_PARAMETERS,  parameter_string(_i));
        ++_i;
    }
    
    if (SNITCH_NETWORK_MODE == 2) network_set_config(network_config_connect_timeout, SNITCH_NETWORK_CONNECTION_TIMEOUT);
    
    
    
    #region Set SNITCH_OS_NAME, SNITCH_OS_VERSION, SNITCH_ENVIRONMENT_NAME, SNITCH_BROWSER, global.__snitchOSInfo
        
    global.__snitchOSName    = "Unknown (=" + string(os_type) + ")";
    global.__snitchOSVersion = "v" + string(os_version);
    global.__snitchBrowser           = "Unknown browser";
    global.__snitchEnvironmentName  = global.__snitchOSName + " " + global.__snitchOSVersion;
    
    switch(os_type)
    {
        case os_windows:
        case os_win8native:
            global.__snitchOSName     = "Windows";
            global.__snitchGAPlatform = "windows";
              
            switch(os_version)
            {
                case 327680: global.__snitchOSVersion = "2000";  global.__snitchGAPlatform = global.__snitchGAPlatform + " 5.0"  break;
                case 327681: global.__snitchOSVersion = "XP";    global.__snitchGAPlatform = global.__snitchGAPlatform + " 5.1"; break;
                case 237862: global.__snitchOSVersion = "XP";    global.__snitchGAPlatform = global.__snitchGAPlatform + " 5.2"; break;
                case 393216: global.__snitchOSVersion = "Vista"; global.__snitchGAPlatform = global.__snitchGAPlatform + " 6";   break;
                case 393217: global.__snitchOSVersion = "7";     global.__snitchGAPlatform = global.__snitchGAPlatform + " 7";   break;
                case 393218: global.__snitchOSVersion = "8";     global.__snitchGAPlatform = global.__snitchGAPlatform + " 8";   break;
                case 393219: global.__snitchOSVersion = "8.1";   global.__snitchGAPlatform = global.__snitchGAPlatform + " 8.1"; break;
                case 655360: global.__snitchOSVersion = "10";    global.__snitchGAPlatform = global.__snitchGAPlatform + " 10";  break;
            }
        break;
        
        case os_uwp:
            global.__snitchOSName    = "UWP";
            global.__snitchOSVersion = string(os_version);
            
            global.__snitchGAPlatform  = "uwp_console"; //Dunno how to detect whether we're on console or not
            global.__snitchGAOSVersion = global.__snitchGAPlatform + " " + string(os_version);
        break;
        
        case os_linux:
            global.__snitchOSName    = "Linux";
            global.__snitchOSVersion = string(os_version);
            
            global.__snitchGAPlatform  = "linux";
            global.__snitchGAOSVersion = global.__snitchGAPlatform + " " + string(os_version);
        break;
        
        case os_macosx:
            global.__snitchOSName    = "macOS";
            global.__snitchOSVersion = string(os_version >> 24) + "." + string((os_version >> 12) & 0xfff);
            
            global.__snitchGAPlatform  = "mac_osx";
            global.__snitchGAOSVersion = global.__snitchGAPlatform + " " + string(os_version);
        break;
        
        case os_ios:
            global.__snitchOSName    = "iOS";
            global.__snitchOSVersion = string(os_version >> 24) + "." + string((os_version >> 12) & 0xfff);
            
            global.__snitchGAPlatform  = "ios";
            global.__snitchGAOSVersion = global.__snitchGAPlatform + " " + string(os_version);
        break;
        
        case os_android:
            global.__snitchOSName = "Android";
            
            switch(os_version)
            {
                case 21: global.__snitchOSVersion = "Lollipop";    break;
                case 22: global.__snitchOSVersion = "Lollipop";    break;
                case 23: global.__snitchOSVersion = "Marshmallow"; break;
                case 24: global.__snitchOSVersion = "Nougat";      break;
                case 25: global.__snitchOSVersion = "Oreo";        break;
                case 26: global.__snitchOSVersion = "Pie";         break;
                
                default:
                    if (os_version >= 27)
                    {
                        global.__snitchOSVersion = "v" + string(os_version - 17);
                    }
                break;
            }
            
            global.__snitchGAPlatform  = "android";
            global.__snitchGAOSVersion = global.__snitchGAPlatform + " " + string(os_version);
        break;
        
        case os_tvos:         global.__snitchOSName = "tvOS";             global.__snitchGAPlatform = "tvos";    global.__snitchGAOSVersion = global.__snitchGAPlatform; break;
        case os_ps3:          global.__snitchOSName = "PlayStation 3";    global.__snitchGAPlatform = "ps3";     global.__snitchGAOSVersion = global.__snitchGAPlatform; break;
        case os_ps4:          global.__snitchOSName = "PlayStation 4";    global.__snitchGAPlatform = "ps4";     global.__snitchGAOSVersion = global.__snitchGAPlatform; break;
        case os_ps5:          global.__snitchOSName = "PlayStation 5";    global.__snitchGAPlatform = "psm";     global.__snitchGAOSVersion = global.__snitchGAPlatform; break; //No PS5
        case os_psvita:       global.__snitchOSName = "PlayStation Vita"; global.__snitchGAPlatform = "vita";    global.__snitchGAOSVersion = global.__snitchGAPlatform; break;
        case os_xboxone:      global.__snitchOSName = "Xbox One";         global.__snitchGAPlatform = "xboxone"; global.__snitchGAOSVersion = global.__snitchGAPlatform; break;
        case os_xboxseriesxs: global.__snitchOSName = "Xbox Series X/S";  global.__snitchGAPlatform = "xboxone"; global.__snitchGAOSVersion = global.__snitchGAPlatform; break; //No Xbox Series X/S
        case os_switch:       global.__snitchOSName = "Switch";           global.__snitchGAPlatform = "wiiu";    global.__snitchGAOSVersion = global.__snitchGAPlatform; break; //No Switch OS
        case os_operagx:      global.__snitchOSName = "GX.games";         global.__snitchGAPlatform = "windows"; global.__snitchGAOSVersion = global.__snitchGAPlatform; break; //No idea how to deal with this
    }
    
    //Figure out what browser we're using
    switch(os_browser)
    {
        case browser_not_a_browser: global.__snitchBrowser = "Not a browser";     break;
        case browser_ie:            global.__snitchBrowser = "Internet Explorer"; break;
        case browser_ie_mobile:     global.__snitchBrowser = "Internet Explorer"; break;
        case browser_firefox:       global.__snitchBrowser = "Firefox";           break;
        case browser_chrome:        global.__snitchBrowser = "Chrome";            break;
        case browser_safari:        global.__snitchBrowser = "Safari";            break;
        case browser_safari_mobile: global.__snitchBrowser = "Safari";            break;
        case browser_opera:         global.__snitchBrowser = "Opera";             break;
    }
    
    //If we're on a browser, use the browser's name instead
    if (os_browser == browser_not_a_browser)
    {
        global.__snitchEnvironmentName = global.__snitchOSName + " " + global.__snitchOSVersion;
    }
    else
    {
        global.__snitchEnvironmentName = global.__snitchBrowser;
    }
    
    //Turn the os_get_info() map into a struct for serialization
    global.__snitchOSInfo = {};
    if (os_type != os_switch) //TODO - Workaround for a crash on Switch (runtime 2.3.6   2022-02-04)
    {
        var _infoMap = os_get_info();
        
        var _key = ds_map_find_first(_infoMap);
        repeat(ds_map_size(_infoMap))
        {
            global.__snitchOSInfo[$ _key] = _infoMap[? _key];
            _key = ds_map_find_next(_infoMap, _key);
        }
        
        ds_map_destroy(_infoMap);
    }
    
    #endregion
    
    
    
    if (SNITCH_LOG_ON_BOOT) SnitchLogSet(true);
    if (SNITCH_NETWORK_ON_BOOT) SnitchNetworkSet(true);
    __SnitchTrace("Welcome to Snitch by @jujuadams! This is version " + string(SNITCH_VERSION) + ", " + string(SNITCH_DATE));
    __SnitchTrace("Running ", global.__snitchRunningFromIDE? "from IDE" : "compiled executable", ", crash capture turned ", global.__snitchCrashCapture? "on" : "off");
    
    
    
    if (global.__snitchCrashCapture)
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
            global.__snitchRequestBackupOrder = json_parse(_json);
            
            if (!is_array(global.__snitchRequestBackupOrder)) throw "Not an array";
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
            
            global.__snitchRequestBackupOrder = [];
        }
        finally
        {
            if (_loadedManifest) buffer_delete(_buffer);
        }
        
        if (_loadedManifest)
        {
            var _expected = array_length(global.__snitchRequestBackupOrder);
            var _missing = 0;
            
            var _i = _expected - 1;
            repeat(_expected)
            {
                var _uuid = global.__snitchRequestBackupOrder[_i];
                
                var _filename = __SnitchRequestBackupFilename(_uuid);
                if (!file_exists(_filename))
                {
                    _missing++;
                    array_delete(global.__snitchRequestBackupOrder, _i, 1);
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
                        global.__snitchRequestBackups[$ _uuid] = _request;
                    }
                    
                    buffer_delete(_buffer);
                }
                
                --_i;
            }
            
            __SnitchTrace("Found ", array_length(global.__snitchRequestBackupOrder), " request backups (", _expected, " in manifest, of which ", _missing, " were missing)");
        }
        
        __SnitchRequestBackupSaveManifest();
    }
    
    
    if (SNITCH_SERVICE_MODE > 0)
    {
        //Force a network connection if possible
        os_is_network_connected(true);
        
        //Send off a ping to test if SnitchHTTPAsyncEvent() has been placed in the correct event
        http_get("https://www.google.com/");
        global.__snitchHTTPTestTime = SNITCH_FOCUS_TIME;
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
            
            global.__snitchSentryPublicKey = string_copy(_DSN, _protocolPosition + 3, _atPosition - (_protocolPosition + 3));
            if (global.__snitchSentryPublicKey == "") __SnitchError("No public key found in DSN string");
            
            var _slashPosition = string_last_pos("/", _DSN);
            
            var _DSNHostPath = string_copy(_DSN, _atPosition + 1, _slashPosition - (_atPosition + 1));
            if (_DSNHostPath == "") __SnitchError("No host/path found in DSN string");
            
            var _DSNProject = string_copy(_DSN, _slashPosition + 1, string_length(_DSN) - _slashPosition);
            if (_DSNProject == "") __SnitchError("No project found in DSN string");
            
            global.__snitchEndpoint = _protocol + "://" + _DSNHostPath + "/api/" + _DSNProject + "/store/";
            
            //Build an auth string for later HTTP requests
            //We fill in the timestamp later when sending the request
            global.__snitchSentryAuthString = "Sentry sentry_version=7, sentry_client=Snitch/" + string(SNITCH_VERSION) + ", sentry_key=" + global.__snitchSentryPublicKey + ", sentry_timestamp=";
        break;
        
        //GameAnalytics
        case 2:
            global.__snitchSessionID = SnitchGenerateUUID4String(true);
            
            if ((SNITCH_GAMEANALYTICS_GAME_KEY == "5c6bcb5402204249437fb5a7a80a4959") && (SNITCH_GAMEANALYTICS_SECRET_KEY == "16813a12f718bc5c620f56944e1abc3ea13ccbac"))
            {
                __SnitchTrace("Using GameAnalytics' sandbox endpoint");
                global.__snitchEndpoint = "https://sandbox-api.gameanalytics.com/v2/" + SNITCH_GAMEANALYTICS_GAME_KEY + "/events";
            }
            else
            {
                global.__snitchEndpoint = "https://api.gameanalytics.com/v2/" + SNITCH_GAMEANALYTICS_GAME_KEY + "/events";
            }
        break;
        
        //Bugsnag
        case 3:
        break;
    }
    
    if (SNITCH_SERVICE_ON_BOOT) SnitchServiceSet(true);
    
    
    
    //Set up a per-frame request handler
    time_source_start(time_source_create(time_source_global, 1, time_source_units_frames, function()
    {
        global.__snitchFrames++;
        if (!os_is_paused() && window_has_focus())
        {
            global.__snitchFocusFrames++;
            global.__snitchFocusTime += delta_time/1000;
        }
        
        //Perform HTTP event test timeout
        //This will throw an error if the user hasn't called SnitchHTTPAsyncEvent()
        if (SNITCH_SERVICE_MODE > 0)
        {
            if ((global.__snitchHTTPTestTime != undefined) && (SNITCH_FOCUS_TIME - global.__snitchHTTPTestTime > __SNITCH_HTTP_TEST_TIMEOUT))
            {
                if (SNITCH_RUNNING_FROM_IDE)
                {
                    __SnitchError("HTTP ping failed to resolve\nPlease check that SnitchHTTPAsyncEvent() is being called in an HTTP Async event in a persistent object");
                }
                else
                {
                    SnitchError("HTTP ping failed to resolve. Please check that SnitchHTTPAsyncEvent() is being called in a HTTP Async event in a persistent object").SendAll();
                }
            }
        }
        
        if (SNITCH_NETWORK_MODE == 2)
        {
            if (!global.__snitchNetworkTested && (global.__snitchNetworkTestTime != undefined) && (SNITCH_FOCUS_TIME - global.__snitchNetworkTestTime > SNITCH_NETWORK_CONNECTION_TIMEOUT + 1000))
            {
                if (SNITCH_RUNNING_FROM_IDE)
                {
                    __SnitchError("TCP connection failed to resolve\nPlease check that SnitchNetworkingAsyncEvent() is being called in a Networking Async event in a persistent object");
                }
                else
                {
                    SnitchError("TCP connection failed to resolve. Please check that SnitchNetworkingAsyncEvent() is being called in a Networking Async event in a persistent object").SendAll();
                }
            }
            
            if (global.__snitchNetworkConnected)
            {
                //Churn through the pending messages and clear them out
                repeat(ceil(sqrt(array_length(global.__snitchNetworkPendingMessages))))
                {
                    __SnitchSendStringToNetwork(global.__snitchNetworkPendingMessages[0]);
                    array_delete(global.__snitchNetworkPendingMessages, 0, 1);
                }
            }
        }
        
        if (global.__snitchRequestBackupFailures < SNITCH_REQUEST_BACKUP_RESEND_MAX_FAILURES)
        {
            if (current_time - global.__snitchRequestBackupResendTime > SNITCH_REQUEST_BACKUP_RESEND_DELAY)
            {
                var _backupCount = array_length(global.__snitchRequestBackupOrder);
                if (_backupCount > 0)
                {
                    //Step round the request backup array
                    global.__snitchRequestBackupResendIndex = (global.__snitchRequestBackupResendIndex + 1) mod _backupCount;
                    
                    //Pull out a backup...
                    var _uuid = global.__snitchRequestBackupOrder[global.__snitchRequestBackupResendIndex];
                    with(global.__snitchRequestBackups[$ _uuid])
                    {
                        //...and if we're not waiting for a response for this particular request, resend it
                        if (asyncID < 0)
                        {
                            if (SNITCH_REQUEST_BACKUP_OUTPUT_ATTEMPT) __SnitchTrace("Trying to resend event ", _uuid);
                            
                            switch(SNITCH_SERVICE_MODE)
                            {
                                case 1: __SnitchSentryHTTPRequest(self);        break;
                                case 2: __SnitchGameAnalyticsHTTPRequest(self); break;
                                case 3: __SnitchBugsnagHTTPRequest(self);       break;
                            }
                            
                            global.__snitchRequestBackupResendTime = current_time;
                        }
                    }
                }
            }
        }
        else
        {
            if (current_time - global.__snitchRequestBackupResendTime > SNITCH_REQUEST_BACKUP_RESEND_FAILURE_TIMEOUT)
            {
                global.__snitchRequestBackupFailures = 0;
                __SnitchTrace("Retrying backup resending");
            }
        }
    }, [], -1));
}

function __SnitchServiceName()
{
    switch(SNITCH_SERVICE_MODE)
    {
        case 0: return "None";          break;
        case 1: return "sentry.io";     break;
        case 2: return "GameAnalytics"; break;
        case 3: return "Bugsnag";       break;
        
        default:
            __SnitchError("SNITCH_SERVICE_MODE value ", SNITCH_SERVICE_MODE, " unsupported");
        break;
    }
}

function __SnitchTrace()
{
    var _string = "Snitch: ";
    var _i = 0;
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    SnitchSendStringToLogFile(_string);
    SnitchSendStringToNetwork(_string);
    show_debug_message(_string);
}

function __SnitchError()
{
    var _string = "";
    var _i = 0;
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    show_error("Snitch:\n" + _string + "\n ", true);
}