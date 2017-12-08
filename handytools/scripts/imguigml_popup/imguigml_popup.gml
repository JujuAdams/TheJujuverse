///@param title_text
///@param body_text

if ( IMGUI_ON ) {
	
	with( tr_instance_create( 0, 0, obj_imgui_popup ) ) {
		window_name = argument0;
		window_text = argument1;
	}
	
	trace( "POPUP", TRACE_DIV, argument1 );
	
} else {
	
	trace_loud( argument1 );
	
}
