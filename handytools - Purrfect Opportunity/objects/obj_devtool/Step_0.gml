if ( keyboard_check_pressed( vk_f11 ) ) and ( IMGUI_ON ) {
	show_window = !show_window;
	if ( show_window ) window_has_set_size = false;
}

if ( !instance_exists( obj_imgui ) ) show_window = false;

if ( show_window ) {
	
	var ret = imguigml_begin( window_name, true,
	                          EImGui_WindowFlags.MenuBar |
							  EImGui_WindowFlags.AlwaysVerticalScrollbar |
							  EImGui_WindowFlags.AlwaysHorizontalScrollbar );
	if ( !ret[1] ) {
		show_window = false;
		window_has_set_size = false;
	}
	
	if ( !window_has_set_size ) {
		window_has_set_size = true;
		imguigml_set_window_size( window_name, window_width, window_height );
	} else {
		var _w = imguigml_get_window_width( window_name );
		var _h = imguigml_get_window_height( window_name );
		if ( window_width != _w ) window_has_set_columns = false;
		window_width = _w;
		window_height = _h;
	}
	
	imguigml_begin_menu_bar();
	if ( imguigml_menu_item( "Home"      ) ) window_page = E_EDITOR_PAGE.HOME;
	if ( imguigml_menu_item( "Instances" ) ) window_page = E_EDITOR_PAGE.INSTANCES;
	imguigml_end_menu_bar();
	
	switch( window_page ) {
		case E_EDITOR_PAGE.HOME:
			
		break;
		case E_EDITOR_PAGE.INSTANCES:
			
		break;
	}
	
	imguigml_end();
	
}