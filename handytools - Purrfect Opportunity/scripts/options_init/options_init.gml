//--------------------
// Configuration
//--------------------
global.options_defaults = tr_map_create( "options (defaults)", true );
global.options_defaults[? "version"         ] = VERSION;
global.options_defaults[? "lock mouse"      ] = false;
global.options_defaults[? "fxaa"            ] = false;
global.options_defaults[? "animations"      ] = true;
global.options_defaults[? "transitions"     ] = true;
global.options_defaults[? "music"           ] = 0.4;
global.options_defaults[? "sounds"          ] = 0.75;
global.options_defaults[? "master volume"   ] = 1.0;
global.options_defaults[? "intro"           ] = false;
global.options_defaults[? "player name"     ] = DEFAULT_PLAYER_NAME;
global.options_defaults[? "server password" ] = "";
global.options_defaults[? "window width"    ] = DEFAULT_WINDOW_WIDTH;
global.options_defaults[? "window height"   ] = DEFAULT_WINDOW_HEIGHT;
global.options_defaults[? "window x"        ] = DEFAULT_WINDOW_X;
global.options_defaults[? "window y"        ] = DEFAULT_WINDOW_Y;

//--------------------
// Internal
//--------------------
global.options_json = tr_map_create( "options", true );
options_set_defaults();
options_default_controls();

if ( !file_exists( "options.txt" ) ) {
	options_save();
} else {
	options_load();
	if ( options_get( "version", "INVALID VERSION" ) != VERSION ) {
		options_set_defaults();
		options_default_controls();
		options_save();
	}
}

options_apply();