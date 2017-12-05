if ( keyboard_check_pressed( vk_f11 ) ) and ( IMGUI_ON ) {
	show_window = !show_window;
	if ( show_window ) window_has_set_size = false;
}

if ( !instance_exists( obj_imgui ) ) show_window = false;

if ( show_window ) {
	
	var ret = imguigml_begin( window_name, true,
	                          EImGui_WindowFlags.NoResize |
	                          EImGui_WindowFlags.NoMove |
	                          EImGui_WindowFlags.MenuBar |
							  EImGui_WindowFlags.AlwaysVerticalScrollbar |
							  EImGui_WindowFlags.AlwaysHorizontalScrollbar );
	if ( !ret[1] ) {
		show_window = false;
		window_has_set_size = false;
	}
	
	if ( !window_has_set_size ) {
		imguigml_set_window_pos( window_name, 10, 10 );
		imguigml_set_window_size( window_name, window_width, window_height );
	} else {
		var _w = imguigml_get_window_width( window_name );
		var _h = imguigml_get_window_height( window_name );
		if ( window_width != _w ) window_has_set_columns = false;
		window_width = _w;
		window_height = _h;
	}
	
	imguigml_begin_menu_bar();
	if ( imguigml_menu_item( "Place"      ) ) window_page = E_EDITOR_PAGE.HOME;
	if ( imguigml_menu_item( "Instances" ) ) window_page = E_EDITOR_PAGE.INSTANCES;
	imguigml_end_menu_bar();
	
	switch( window_page ) {
		
		case E_EDITOR_PAGE.HOME:
		#region HOME
			window_name = "Editor - Place";
			imguigml_text( "PLACE" );
			imguigml_separator();
			
			var _size = ds_list_size( object_list );
			for( var _i = 0; _i < _size; _i++ ) {
				
				var _object = object_list[| _i ];
				
				if ( _object != "" ) {
					if ( imguigml_button( object_get_pretty_name( _object ) ) ) {
						
			            var _x = obj_camera.x + lengthdir_x( 30, obj_camera.look_xy_angle );
			            var _y = obj_camera.y + lengthdir_y( 30, obj_camera.look_xy_angle );
			            var _inst = tr_instance_create_z( _x, _y, obj_camera.z, 180 - obj_camera.look_xy_angle, _object );
			            with( _inst ) {
			                mouse_selected = true;
			                mouse_active_set_relative_values();
			            }
						
					}
				}
				
				if ( object_list[| _i+1 ] == "" ) imguigml_new_line() else imguigml_same_line();
				
			}
		#endregion
		break;
		
		case E_EDITOR_PAGE.INSTANCES:
		#region INSTANCES
			window_name = "Editor - Instances";
			imguigml_text( "INSTANCES" );
			imguigml_separator();
			imguigml_columns( 5, "Columns", true );
			imguigml_next_column();
			imguigml_text( "Object" );
			imguigml_next_column();
			imguigml_text( "x" );
			imguigml_next_column();
			imguigml_text( "y" );
			imguigml_next_column();
			imguigml_text( "z" );
			imguigml_next_column();
			imguigml_separator();
			with( obj_par_3d ) {
				if ( mouse_selected ) imguigml_text( "S" );
				imguigml_next_column();
				if ( mouse_interactible ) {
					if ( imguigml_button( concat( object_get_pretty_name( object_index ), ":", id ) ) ) mouse_selected = !mouse_selected;
				} else {
					imguigml_text( concat( object_get_pretty_name( object_index ), ":", id ) );
				}
				imguigml_next_column();
				//imguigml_text( string( x ) );
				imguigml_next_column();
				//imguigml_text( string( y ) );
				imguigml_next_column();
				//imguigml_text( string( z ) );
				imguigml_next_column();
			}
			imguigml_set_column_width( 0,  25 );
			imguigml_set_column_width( 1, 170 );
		#endregion
		break;
		
	}
	
	imguigml_end();
	
}