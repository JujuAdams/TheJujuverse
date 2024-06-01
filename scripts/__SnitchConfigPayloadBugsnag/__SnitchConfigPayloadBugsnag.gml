// Feather disable all
// https://bugsnagerrorreportingapi.docs.apiary.io/#reference/0/notify/send-error-reports

function __SnitchConfigPayloadBugsnag(_uuid, _message, _longMessage, _callstack, _fatal)
{
    return {
        payloadVersion: "5",
        notifier: {
            name: "Snitch",
            version: SNITCH_VERSION,
            url: "https://github.com/jujuAdams/snitch/",
        },
        events: [
            {
                exceptions: [
                    {
                        errorClass: _message,
                        message: _longMessage,
                        stacktrace: _callstack,
                    },
                ],
                
                severity: _fatal? "error" : "warning",
                
                app: {
                    id: game_project_name,
                    version: GM_version,
                    releaseStage: SNITCH_RUNNING_FROM_IDE? "development" : "production",
                    duration: SNITCH_SESSION_TIME,
                    durationInForeground: SNITCH_FOCUS_TIME,
                    inForeground: bool(!os_is_paused()),
                    
                },
                
                device: {
                    osName: SNITCH_OS_NAME,
                    osVersion: SNITCH_OS_VERSION,
                    browserName: SNITCH_BROWSER,
                    time: SnitchFormatTimestamp(date_current_datetime()),
                },
                
                metaData: {
                    app: {
                        buildDate:        date_datetime_string(GM_build_date),
                        config:           os_get_config(),
                        gmRuntime:        GM_runtime_version,
                        networkConnected: bool(os_is_network_connected(false)),
                        osInfo:           SNITCH_OS_INFO,
                        osLanguage:       os_get_language(),
                        osRegion:         os_get_region(),
                        runningFromIDE:   bool(SNITCH_RUNNING_FROM_IDE),
                        steamConnected:   bool(SnitchSteamInitializedSafe()),
                        yyc:              bool(code_is_compiled()),
                    },
                },
            },
        ],
    };
}
