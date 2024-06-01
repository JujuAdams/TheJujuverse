// Feather disable all
// Used for log header info and crash data

function __SnitchConfigAppState()
{
    return {
        appName:          game_display_name,
        appStartTime:     date_datetime_string(SNITCH_SESSION_START_TIME),
        appVersion:       GM_version,
        bootParameters:   SNITCH_BOOT_PARAMETERS,
        browser:          SNITCH_BROWSER,
        buildDate:        date_datetime_string(GM_build_date),
        config:           os_get_config(),
        gmRuntime:        GM_runtime_version,
        networkConnected: bool(os_is_network_connected(false)),
        osInfo:           SNITCH_OS_INFO,
        osLanguage:       os_get_language(),
        osRegion:         os_get_region(),
        osType:           SNITCH_OS_NAME,
        osVersion:        SNITCH_OS_VERSION,
        paused:           bool(os_is_paused()),
        runningFromIDE:   bool(SNITCH_RUNNING_FROM_IDE),
        steamConnected:   bool(SnitchSteamInitializedSafe()),
        timestamp:        date_datetime_string(date_current_datetime()),
        yyc:              bool(code_is_compiled()),
    };
}
