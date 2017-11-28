/*
	For default options/controls, see options_init() and options_default_controls()
	All possible inputs need to be defined in control_init()
*/

//--------------------
// Configuration
//--------------------
#macro DEFAULT_PLAYER_NAME "mittens"

#macro PLAYER_A_COLOUR_DARK make_colour_rgb( 214, 107, 13 )
#macro PLAYER_B_COLOUR_DARK make_colour_rgb( 7, 19, 78 )
#macro PLAYER_A_COLOUR_LIGHT make_colour_rgb( 254, 184, 33 )
#macro PLAYER_B_COLOUR_LIGHT make_colour_rgb( 29, 111, 138 )

enum e_game_state { menu, intro_pause, intro, messages, intro_pan,
	                play_1a, follow_1a, pan_1a,
					play_2a, follow_2a,
					disturbed_pan, disturbed, pan_2a,
					play_2b, follow_2b, pan_2b,
					play_1b, follow_1b, pan_1b,
					end_pause, scoring, scritch, bite, outro, outro_transition }

enum e_game_mode { ai, single, local_ }

//--------------------
// Internal
//--------------------