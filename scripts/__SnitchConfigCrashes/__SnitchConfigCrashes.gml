// Feather disable all
//SNITCH_CRASH_CAPTURE_COMPILED controls whether to capture crashes using Snitch's own exception handler
//Snitch's exception handler is *not* mutually exclusive with exception_unhandled_handler() (Snitch hijacks calls to that function and executes the handler itself)
//The crash handler can save a crash dump, can prompt the user to copy error data onto their clipboard, and can immediately send events to bug tracking services
#macro SNITCH_CRASH_CAPTURE_COMPILED  true

//Whilst Snitch's crash handler is really snazzy, it can make tracking down bugs a bit harder when you're running from the IDE during development
//Setting this macro to <false> will prevent Snitch from capturing crashes when running in debug mode from the IDE (i.e. running using F5/F6)
#macro SNITCH_CRASH_CAPTURE_FROM_IDE  true

//Name of the crash dump file. What exactly is reported in the crash event can be configured by changing SWITCH_CRASH_DUMP_MODE
#macro SNITCH_CRASH_DUMP_FILENAME  "crash.txt"

//How much data to save to disk when the game crashes
//There are 4 modes:
//   0:  Don't save any crash data
//   1:  Save the exception struct that GameMaker generates to the clipboard
//   2:  Save the full crash event payload to disk
//   3:  Compress and base64 encode full crash event payload, and save that
#macro SWITCH_CRASH_DUMP_MODE  2

//Whether to ask the user if they want to copy the error message to their clipboard
//This is useful in production to get crash data more easily from players
//There are 4 modes:
//   0:  Don't ask the player to copy crash data to their clipboard at all and just show the string defined by SNITCH_CRASH_NO_CLIPBOARD_MESSAGE
//   1:  Allow the player to copy the exception struct that GameMaker generates to the clipboard
//   2:  Copy full crash event payload to their clipboard as plaintext JSON
//   3:  Compress and base64 encode full crash event payload to the player's clipboard
//All clipboard data is bookended with five hashes (##### content #####) to help make copy-pasting easier
#macro SWITCH_CRASH_CLIPBOARD_MODE  1

//Pop-up message to show the player when the game crashes
//This message will only be shown if SNITCH_CRASH_OFFER_CLIPBOARD is set to 0
//   N.B. If you don't get an error pop-up then you've got a syntax error somewhere in the macro. Check for typos!
#macro SNITCH_CRASH_NO_CLIPBOARD_MESSAGE  ("Oh no! The game has crashed. Please reboot the game and try again.\n\nThe error was:\n\"" + string(_struct.message) + "\"\n" + string(_struct.stacktrace))

//Messages to show when asking the player if they'd like to copy the error message to their clipboard
//   N.B. Use \r rather than \n to work around a GameMaker bug in show_question() (runtime GMS2.3.2.426, 2021-05-05)
#macro SNITCH_CRASH_CLIPBOARD_REQUEST_MESSAGE  ("Oh no! The game has crashed. Please reboot the game and try again.\r\r\rThe error was:\r\"" + string(_struct.message) + "\"\r" + string(_struct.stacktrace) + "\r\r\rWould you like to copy the error message to your clipboard?")
#macro SNITCH_CRASH_CLIPBOARD_ACCEPT_MESSAGE   ("The error message has been copied to your clipboard.")
