if ( async_load[? "id" ] == async ) {
	if ( async_load[? "status" ] ) and ( async_load[? "result" ] != "" ) {
		
		options_set( "server password", async_load[? "result" ] );
		/*if ( room != rm_options )*/ options_save();
		
	}
}