This note file details native Snitch macro that you can use to configure Snitch. You may also find
these macros useful elsewhere in your game. All macros are read-only.

SNITCH_RUNNING_FROM_IDE
  Whether the application was booted from the GameMaker IDE. Very useful for adding safety checks
  to prevent debug behaviour from being executed when in production.

SNITCH_FRAMES
  How many rendering frames have been drawn since the game started.

SNITCH_SESSION_TIME
  How many milliseconds have elapsed since the game was started. This may include time that the
  game window is backgrounded and/or out of focus, depending on platform.

SNITCH_FOCUS_FRAMES
  How many rendering frames have been drawn whilst the game window has been in focus.

SNITCH_FOCUS_TIME
  How long the game has been running in focus in milliseconds.
  
SNITCH_VERSION
  The version of Snitch being used, as a string.

SNITCH_DATE
  The build date for this version of Snitch, as a string.

SNITCH_SESSION_ID
  A unique identifier for each time the game is run.

SNITCH_SESSION_START_TIME
  UTC time that the session was started.

SNITCH_OS_NAME
  Human-readable name for the current OS, as a string. The following are values that this macro
  can hold:
  "Windows"  "UWP"  "Linux"  "macOS"  "iOS"  "tvOS"  "Android"  "PlayStation 3"
  "PlayStation 4"  "PlayStation 5"  "PlayStation Vita"  "Xbox One"  "Xbox Series X/S"
  "Switch"  "GX.games"
  
SNITCH_OS_VERSION
  Human-readable version of the current OS, as a string. There is no definitive list of values that
  this macro can hold.

SNITCH_BROWSER
  Human-readable browser name, as a string. The following are values that this macro can hold:
  "Internet Explorer"  "Firefox"  "Chrome"  "Safari"  "Opera"
  
SNITCH_ENVIRONMENT_NAME
  Human-readable name that either:
  - Is the name of the browser that the game is being played in, or
  - Is a combination of the OS and the OS version together as a string.

SNITCH_OS_INFO
  Persistent struct containing data relating to the OS enviroment. This holds the same data as the
  ds_map returned by os_get_info() but in struct format for easier handling.

SNITCH_BOOT_PARAMETERS
  Persistent array of boot parameters that were used to start the application. This holds the same
  data as parameter_string() etc. but in array format for easier handling.