// Feather disable all
//How many strings to store in the in-game copy of the log
//You can fetch strings using SnitchLogGetString()
#macro SNITCH_IN_GAME_LOG_SIZE  20

//Controls whether logging to file should be allowed at all
#macro SNITCH_LOG_PERMITTED  true

//Whether to boot the game with logging to file turned on or off. Logging to file can be turned on/off manually by calling SnitchLogSet()
//Generally, you'll only want to set this to <true> if you're running dev/debug builds as logging messages to a file can be slow
//See SNITCH_ALLOW_LOG_BOOT_PARAMETER below for information on toggling logging on/off for production builds
#macro SNITCH_LOG_ON_BOOT  (SNITCH_RUNNING_FROM_IDE)

//Whether to allow logging to be toggled on by using the "-log" execution parameter
//This is useful for in-production testing so you can turn on logging without the option normally being available to the end-user
#macro SNITCH_ALLOW_LOG_BOOT_PARAMETER  true

//Pop-up message to show when the game is booted with the "-log" execution parameter
#macro SNITCH_LOG_BOOT_PARAMETER_CONFIRMATION  ("Logging enabled! You can find the logs in " + string(game_save_id))

//Name of the log files to save. Use a # symbol for number position
#macro SNITCH_LOG_FILENAME  "log#.txt"

//Number of log files to store on disk
//A new log file is created every time the game is run. The 0th log file is always the most recent
#macro SNITCH_LOG_COUNT  10

//Starting size of the Snitch logging buffer, in bytes. 1024*1024 bytes is 1 megabyte
//This buffer is a "buffer_grow" type and will dynamically resize as more data is added
#macro SNITCH_LOG_BUFFER_START_SIZE  (1024*1024)
