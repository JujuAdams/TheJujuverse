///@desc example - step

var size = [ 0, 0 ];
if (ShowTestWindow) {
	
	var ret = imguigml_begin("Testing", ShowTestWindow, EImGui_WindowFlags.AlwaysVerticalScrollbar );
	if ( !ret[1] ) ShowTestWindow = false;
	imguigml_set_window_size( "Testing", 400, 100 );
	imguigml_columns( 2, undefined, true );
	repeat( 100 ) {
		imguigml_text( "Hello" );
		imguigml_next_column();
		imguigml_text( "World" );
		imguigml_next_column();
	}
	/*
	ShowTestWindow = ret[1];
	if (ret[0]) {
		
		imguigml_text("Hey!");
		imguigml_separator();
		imguigml_begin_child("test",0,0,false,EImGui_WindowFlags.HorizontalScrollbar);
		
		if (imguigml_button("Click Me")) {
		    ShowSecondWindow = !ShowSecondWindow;
		    size = imguigml_get_window_size();
		}
		
		imguigml_end_child();
		
	}
	*/
	imguigml_end();
	
}

if (ShowSecondWindow) {
	
	var pos  = imguigml_get_window_pos();
	imguigml_set_next_window_pos(pos[0], pos[1] + size[1] + 10, EImGui_Cond.Appearing);
	
	var ret = imguigml_begin("Hey Folks!");
	if (ret[0]) {
		imguigml_text("I'm just a block of text.");
		imguigml_separator();
		imguigml_slider_float3("Some floats!", 0.2, 0.4, 0.6, 0.0, 1.0);
		imguigml_plot_histogram("Histogram", [ 0.1, 2.0, 4.5, 2.5, 1.0, 2.0 ]);    
	}
	
	imguigml_end();
}