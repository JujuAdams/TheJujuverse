/*
	For default options/controls, see options_init() and options_default_controls()
	All possible inputs need to be defined in control_init()
*/

//--------------------
// Configuration
//--------------------
//Release flags
#macro RELEASE false
#macro TITLE "handytools"
#macro VERSION "v0.1.0"
#macro AUTHOR "Code: @jujuadams  |  Assets: @i_am_thireen + @gartman_gh + @blokatt  |  Special Thanks: @tophtacular"
#macro BUILDER "@jujuadams"
#macro DATE "2017.11.26"
#macro DEVTOOLS (true && !RELEASE)

//Debug flags
#macro TRACE_SHOW true
#macro TRACE_SHOW_ERROR true
#macro ERROR_DEPRECIATED_SCRIPTS true
#macro GAMEFLOW_DEBUG false

//Formatting
#macro NL "\n"
#macro QU "\""
#macro TRACE_DEFAULT_DIVIDER ", "
#macro TRACE_TIME_SPACE_PADDING 6

#macro DEFAULT_WINDOW_WIDTH 960
#macro DEFAULT_WINDOW_HEIGHT 540
#macro DEFAULT_WINDOW_X 0.5*( display_get_width()  - DEFAULT_WINDOW_WIDTH  )
#macro DEFAULT_WINDOW_Y 0.5*( display_get_height() - DEFAULT_WINDOW_HEIGHT )

//--------------------
// Internal
//--------------------
//Abbreviations
#macro APP_SURF application_surface
#macro DEFAULT undefined
#macro UNDF undefined
#macro DFLT undefined
#macro VERY_LARGE 9999999
#macro VERY_SMALL 0.0000001
#macro VERY_NEGATIVE -9999999
#macro CURRENT_TIME_PADDED string_space_padded( current_time, TRACE_TIME_SPACE_PADDING )