// Feather disable all

//Array of texture groups for Texan to always keep loaded. Always-fetch texture groups cannot be
//flushed by Texan as a result.
#macro TEXAN_ALWAYS_FETCH  []

//Whether to call TexanCommit() on boot to load in always-fetch texture groups (defined above).
#macro TEXAN_COMMIT_ON_BOOT  true

//Debug level to pass through to GameMaker. This macro is provided for convenience and, ultimately,
//all Texan does is call GM's native texture_debug_messages() function.
//  0 = No debug message
//  1 = Limited debug messages
//  2 = Verbose debug messages
#macro TEXAN_GM_DEBUG_LEVEL  2

//Debug level for Texan itself. This helps you understand what's going on in the internal logic.
//  0 = No debug message
//  1 = Limited debug messages
//  2 = Verbose debug messages
#macro TEXAN_DEBUG_LEVEL  2