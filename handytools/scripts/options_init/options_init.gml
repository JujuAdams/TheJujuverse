global.options_defaults = tr_map_create( "options (defaults)", true );
global.options_json = tr_map_create( "options", true );
options_default_values();
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