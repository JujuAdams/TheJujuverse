// Feather disable all
// https://restapidocs.gameanalytics.com/

function __SnitchConfigPayloadGameAnalytics(_uuid, _message, _longMessage, _callstack, _fatal)
{
    return [
        {
            //Mandatory fields
            device: "unknown",
            v: int64(2),
            user_id: SNITCH_SESSION_ID, //Deliberately randomized so that players can't be tracked across sessions
            sdk_version: "rest api v2",
            os_version: "windows 10",
            manufacturer: "unknown",
            platform: "windows",
            session_id: SNITCH_SESSION_ID,
            session_num: int64(1), //We're not tracking user IDs so this is always 1
            category: "error",
            severity: __fatal? "critical" : "error",
            message: _message + " " + string(_callstack),
            
            ////You may optionally use the following:
            build: GM_version,
            engine_version: SNITCH_GA_GAMEMAKER_VERSION,
            connection_type: os_is_network_connected(false)? "wifi" : "offline",
            
            //The following fields exist too but are less useful
            /*
            limit_ad_tracking: true,
            logon_gamecenter: false,
            logon_googleplay: false,
            jailbroken: false,
            custom_01: "",
            custom_02: "",
            custom_03: "",
            ios_idfv: "",
            ios_idfa: "",
            google_aid: "",
            */
            
            //These fields exist but I strongly recommend never using them to protect your players' privacy
            /*
            android_id: "",
            googleplus_id: "",
            facebook_id: "",
            gender: "", //According to GameAnalytics this can only be "male" or "female" 
            birth_year: "",
            */
        },
    ];
}
