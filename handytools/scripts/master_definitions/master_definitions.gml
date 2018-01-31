/// @description Internal master definitions

//handytools build information
#macro HANDYTOOLS_VERSION "v0.8.0"
#macro HANDYTOOLS_DATE "2018.01.31" //always use YYYY/MM/DD
#macro HANDYTOOLS_CREDITS "handytools by @jujuadams, ImGUI v1.80.2 implementation by @babyj3ans, JIFFY by @net8floz, Logo by @stefanvanranda, WinDev.dll by @YellowAfterlife, SCREEN with assistance from kraifpatrik"

//abbreviations
#macro UNIQUE_NAME object_get_name( object_index ) + ":" + string( id )
#macro APP_SURF application_surface
#macro DEFAULT undefined
#macro DEF undefined
#macro UD undefined
#macro VERY_LARGE 9999999
#macro VERY_SMALL 0.0000001
#macro VERY_NEGATIVE -9999999
#macro CURRENT_TIME_PADDED string_space_padded( current_time, TRACE_TIME_SPACE_PADDING )
#macro NL "\n"
#macro QU "\""
#macro GUI_WIDTH display_get_gui_width()
#macro GUI_HEIGHT display_get_gui_height()

//UK English
#macro fa_centre fa_center
#macro c_grey c_gray