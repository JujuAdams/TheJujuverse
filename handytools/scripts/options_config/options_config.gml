/// @description OPTIONS configuration

/*
    Option values are stored in a global data structure. Defaults are configured in options_init().
*/

#macro ERROR_KEY_NOT_FOUND (true && !RELEASE)
#macro FORCE_DEFAULT_ON_LOAD (false && !RELEASE)
#macro OPTIONS_FILENAME "options.txt"
#macro OPTIONS_SET_DEFAULT_WHEN_MISSING true