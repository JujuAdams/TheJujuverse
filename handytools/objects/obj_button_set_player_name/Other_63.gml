if ( async_load[? "id" ] == async ) {
	if ( async_load[? "status" ] ) and ( async_load[? "result" ] != "" ) {
		
		options_set( "player name", async_load[? "result" ] );
		/*if ( room != rm_options )*/ options_save();
		text = "SET NAME: " + options_get( "player name", "dingus" );
		script_execute( fit_function );
		
	}
}