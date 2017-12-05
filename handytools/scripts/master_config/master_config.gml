/*
	For default options/controls, see options_init() and options_default_controls()
	All possible inputs need to be defined in control_init()
*/

//release flags
#macro RELEASE false
#macro DEVELOPMENT (false && !RELEASE)
#macro TITLE "handytools + A Mind Is A Small Place"
#macro VERSION "v0.1.0"
#macro VERSION_NOMIKER "Preview"
#macro CREDITS "Code: @jujuadams\nImGUI Implementation: @babyj3ans\nAMIASP Assets: @i_am_thireen + @tophtacular + @blokatt\nSpecial Thanks: The /r/GameMaker Discord"
#macro BUILDER "@jujuadams"
#macro DATE "2017.11.30"

//services
#macro IMGUI_ON   (true && DEVELOPMENT)
#macro TRACKER_ON (true && DEVELOPMENT && !RELEASE)
#macro AUDIO_ON    true
#macro WAN_ON      false
#macro FPS_ON     (false && !RELEASE)
#macro DEVTOOL_ON (true && IMGUI_ON && DEVELOPMENT)
#macro RUMBLE_ON   false

//graphics
#macro FORCE_VSYNC true
#macro FORCE_NO_CURSOR true
#macro FORCE_NO_INTERPOLATION true
#macro DEFAULT_APP_SURF_W 320
#macro DEFAULT_APP_SURF_H 240
#macro DEFAULT_WINDOW_WIDTH 960
#macro DEFAULT_WINDOW_HEIGHT 720
#macro APP_TO_WINDOW_SCALE 3
#macro DEFAULT_WINDOW_X 0.5*( display_get_width()  - DEFAULT_WINDOW_WIDTH  )
#macro DEFAULT_WINDOW_Y 0.5*( display_get_height() - DEFAULT_WINDOW_HEIGHT )

//debug flags
#macro TRACE_SHOW true
#macro TRACE_SHOW_ERROR true
#macro TRACE_TO_GAME_OUTPUT true
#macro ERROR_DEPRECIATED_SCRIPTS (false && !RELEASE)