if ( IMGUI_ON && keyboard_check_pressed( vk_f12 ) ) {
	window_show = !window_show;
	if ( window_show ) {
		window_has_set_size = false;
	} else {
		control_property_set( 0, "mouse", "lock time", current_time );
	}
}

if ( !instance_exists( obj_imgui ) ) window_show = false;

if ( window_show ) {
	
	imguigml_set_next_window_collapsed( window_collapsed );
	window_state = imguigml_begin( window_name, true,
	                               EImGui_WindowFlags.MenuBar |
							       EImGui_WindowFlags.AlwaysVerticalScrollbar |
							       EImGui_WindowFlags.AlwaysHorizontalScrollbar );
	if ( !window_state[1] ) {
		window_show = false;
		window_has_set_size = false;
	}
	window_collapsed = !window_state[0];
	
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
	var _old_page = window_page;
		if ( imguigml_menu_item( "Home"                 ) ) window_page = E_TRACKER_PAGE.HOME;
		if ( imguigml_menu_item( "Output"               ) ) window_page = E_TRACKER_PAGE.OUTPUT;
		if ( GRIP_ON ) if ( imguigml_menu_item( "Grips" ) ) window_page = E_TRACKER_PAGE.GRIPS;
	if ( TRACKER_ON ) {
		if ( imguigml_menu_item( "Maps"                 ) ) window_page = E_TRACKER_PAGE.MAPS;
		if ( imguigml_menu_item( "Lists"                ) ) window_page = E_TRACKER_PAGE.LISTS;
		if ( imguigml_menu_item( "Grids"                ) ) window_page = E_TRACKER_PAGE.GRIDS;
	}
		if ( imguigml_menu_item( "Surfaces"             ) ) window_page = E_TRACKER_PAGE.SURFACES;
		if ( imguigml_menu_item( "Surface Preview"      ) ) window_page = E_TRACKER_PAGE.SURFACE_PREVIEW;
	if ( TRACKER_ON ) {
		if ( imguigml_menu_item( "Vertex Buffers"       ) ) window_page = E_TRACKER_PAGE.VERTEX_BUFFERS;
		if ( imguigml_menu_item( "Instances"            ) ) window_page = E_TRACKER_PAGE.INSTANCES;
	}
	if ( window_page != _old_page ) window_has_set_columns = false;
	imguigml_end_menu_bar();
	
	switch( window_page ) {
		case E_TRACKER_PAGE.HOME:
			#region HOME
				imguigml_text( RELEASE?"Release mode":"Test mode" );
				imguigml_text( TITLE + ", " + VERSION + " " + QU + VERSION_NOMIKER + QU );
				imguigml_text( "Built " + DATE + " by " + BUILDER );
				imguigml_new_line();
				imguigml_text( CREDITS );
				imguigml_new_line();
				devtool_imguigml_home();
			#endregion
		break;
		case E_TRACKER_PAGE.OUTPUT:
			#region OUTPUT
				var _size = ds_list_size( global.master_game_output );
				for( var _i = 0; _i < _size; _i++ ) imguigml_text( global.master_game_output[| _i ] );
			#endregion
		break;
		case E_TRACKER_PAGE.GRIPS:
			#region GRIPS
			
			var _result = imguigml_input_float( concat( QU, global.grip_manual_list[| grip_preview ], QU ), grip_preview, 1, 1, 0 );
			grip_preview = clamp( _result[1], 0, ds_list_size( global.grip_manual_list )-1 );
			imguigml_new_line();
			imguigml_separator();
			imguigml_image( surface_get_texture( grip_preview_surface ), 480, 480 );
			
			#endregion
		break;
		case E_TRACKER_PAGE.MAPS:
			#region MAPS
			imguigml_text( "MAPS" );
			imguigml_same_line();
			if imguigml_button( "Dump" ) trace_f( tr_map_dump() );
			imguigml_same_line();
			if imguigml_button( "Copy to clipboard" ) { clipboard_set_text( tr_map_dump() ); imguigml_popup( "", "Copied to clipboard!" ); }
			imguigml_separator();
			imguigml_columns( 3, "Columns", true );
			imguigml_next_column();
			imguigml_text( "GM" );
			imguigml_next_column();
			imguigml_text( "details" );
			imguigml_next_column();
			imguigml_separator();
			
			var _size = ds_list_size( global.tracker_maps );
			for( var _i = 0; _i < _size; _i++ ) {
				var _id = global.tracker_maps[| _i ];
				
				if ( imguigml_begin_popup( concat( _i, " Pop-up" ) ) ) {
					if ( imguigml_button( "Close" ) ) imguigml_close_current_popup();
					imguigml_same_line();
					imguigml_text( concat( "Tracker ID=", _i ) );
					imguigml_separator();
					imguigml_text( array_unpack( global.tracker_maps_callstack[? _id ], NL, "" ) );
					imguigml_end_popup();
				}
				if ( imguigml_button( concat( "?##", _i ) ) ) imguigml_open_popup( concat( _i, " Pop-up" ) );
				imguigml_next_column();
				imguigml_text( _id );
				imguigml_next_column();
				imguigml_text( tr_map_details( _id, TRACE_DIV ) );
				imguigml_next_column();
			}
			#endregion
		break;
		case E_TRACKER_PAGE.LISTS:
			#region LISTS
			imguigml_text( "LISTS" );
			imguigml_same_line();
			if imguigml_button( "Dump" ) trace_f( tr_list_dump() );
			imguigml_same_line();
			if imguigml_button( "Copy to clipboard" ) { clipboard_set_text( tr_list_dump() ); imguigml_popup( "", "Copied to clipboard!" ); }
			imguigml_separator();
			imguigml_columns( 3, "Columns", true );
			imguigml_next_column();
			imguigml_text( "GM" );
			imguigml_next_column();
			imguigml_text( "details" );
			imguigml_next_column();
			imguigml_separator();
			
			var _size = ds_list_size( global.tracker_lists );
			for( var _i = 0; _i < _size; _i++ ) {
				var _id = global.tracker_lists[| _i ];
				
				if ( imguigml_begin_popup( concat( _i, " Pop-up" ) ) ) {
					if ( imguigml_button( "Close" ) ) imguigml_close_current_popup();
					imguigml_same_line();
					imguigml_text( concat( "Tracker ID=", _i ) );
					imguigml_separator();
					imguigml_text( array_unpack( global.tracker_lists_callstack[? _id ], NL, "" ) );
					imguigml_end_popup();
				}
				if ( imguigml_button( concat( "?##", _i ) ) ) imguigml_open_popup( concat( _i, " Pop-up" ) );
				
				imguigml_next_column();
				imguigml_text( _id );
				imguigml_next_column();
				imguigml_text( tr_list_details( _id, TRACE_DIV ) );
				imguigml_next_column();
			}
			#endregion
		break;
		case E_TRACKER_PAGE.GRIDS:
			#region GRIDS
			imguigml_text( "GRIDS" );
			imguigml_same_line();
			if imguigml_button( "Dump" ) trace_f( tr_grid_dump() );
			imguigml_same_line();
			if imguigml_button( "Copy to clipboard" ) { clipboard_set_text( tr_grid_dump() ); imguigml_popup( "", "Copied to clipboard!" ); }
			imguigml_separator();
			imguigml_columns( 3, "Columns", true );
			imguigml_next_column();
			imguigml_text( "GM" );
			imguigml_next_column();
			imguigml_text( "details" );
			imguigml_next_column();
			imguigml_separator();
			
			var _size = ds_list_size( global.tracker_grids );
			for( var _i = 0; _i < _size; _i++ ) {
				var _id = global.tracker_grids[| _i ];
				
				if ( imguigml_begin_popup( concat( _i, " Pop-up" ) ) ) {
					if ( imguigml_button( "Close" ) ) imguigml_close_current_popup();
					imguigml_same_line();
					imguigml_text( concat( "Tracker ID=", _i ) );
					imguigml_separator();
					imguigml_text( array_unpack( global.tracker_grids_callstack[? _id ], NL, "" ) );
					imguigml_end_popup();
				}
				if ( imguigml_button( concat( "?##", _i ) ) ) imguigml_open_popup( concat( _i, " Pop-up" ) );
				
				imguigml_next_column();
				imguigml_text( _id );
				imguigml_next_column();
				imguigml_text( tr_grid_details( _id, TRACE_DIV ) );
				imguigml_next_column();
			}
			#endregion
		break;
		case E_TRACKER_PAGE.SURFACES:
			#region SURFACES
			imguigml_text( "SURFACES" );
			imguigml_same_line();
			if imguigml_button( "Dump" ) trace_f( tr_surface_dump() );
			imguigml_same_line();
			if imguigml_button( "Copy to clipboard" ) { clipboard_set_text( tr_surface_dump() ); imguigml_popup( "", "Copied to clipboard!" ); }
			imguigml_separator();
			imguigml_columns( 3, "Columns", true );
			imguigml_next_column();
			imguigml_text( "GM" );
			imguigml_next_column();
			imguigml_text( "details" );
			imguigml_next_column();
			imguigml_separator();
			
			imguigml_text( "" );
			imguigml_next_column();
			imguigml_text( string( application_surface ) );
			imguigml_next_column();
			imguigml_text( concat( "<application surface> ", surface_get_width( application_surface ), "x", surface_get_height( application_surface ) ) );
			imguigml_next_column();
			imguigml_separator();
			
			var _size = ds_list_size( global.tracker_surfaces );
			for( var _i = 0; _i < _size; _i++ ) {
				var _id = global.tracker_surfaces[| _i ];
				
				if ( imguigml_begin_popup( concat( _i, " Pop-up" ) ) ) {
					if ( imguigml_button( "Close" ) ) imguigml_close_current_popup();
	 				imguigml_same_line();
					imguigml_text( concat( "Tracker ID=", _i ) );
					imguigml_separator();
					imguigml_text( array_unpack( global.tracker_surfaces_callstack[? _id ], NL, "" ) );
					imguigml_end_popup();
				}
				if ( imguigml_button( concat( "?##", _i ) ) ) imguigml_open_popup( concat( _i, " Pop-up" ) );
				imguigml_same_line();
				if ( imguigml_button( concat( "Pr##", _i ) ) ) {
					surface_preview = _id;
					window_page = E_TRACKER_PAGE.SURFACE_PREVIEW;
				}
				
				imguigml_next_column();
				imguigml_text( _id );
				imguigml_next_column();
				imguigml_text( tr_surface_details( _id, TRACE_DIV ) );
				imguigml_next_column();
			}
			#endregion
		break;
		case E_TRACKER_PAGE.SURFACE_PREVIEW:
			#region SURFACE PREVIEW
			
			var _result = imguigml_input_float( concat( QU, surface_preview, QU ), surface_preview, 1, 1, 0 );
			surface_preview = max( _result[1], 0 );
			imguigml_new_line();
			imguigml_separator();
			if ( surface_exists( surface_preview ) ) {
				imguigml_image( surface_get_texture( surface_preview ), 480, 480 );
			} else {
				imguigml_text( concat( "Surface ", QU, surface_preview, QU, " doesn't exist." ) );
			}
			
			#endregion
		break;
		case E_TRACKER_PAGE.VERTEX_BUFFERS:
			#region VERTEX BUFFERS
			imguigml_text( "VERTEX BUFFERS" );
			imguigml_same_line();
			if imguigml_button( "Dump" ) trace_f( tr_vertex_dump() );
			imguigml_same_line();
			if imguigml_button( "Copy to clipboard" ) { clipboard_set_text( tr_vertex_dump() ); imguigml_popup( "", "Copied to clipboard!" ); }
			imguigml_separator();
			imguigml_columns( 3, "Columns", true );
			imguigml_next_column();
			imguigml_text( "GM" );
			imguigml_next_column();
			imguigml_text( "details" );
			imguigml_next_column();
			imguigml_separator();
			
			var _size = ds_list_size( global.tracker_vbuffs );
			for( var _i = 0; _i < _size; _i++ ) {
				var _id = global.tracker_vbuffs[| _i ];
				
				if ( imguigml_begin_popup( concat( _i, " Pop-up" ) ) ) {
					if ( imguigml_button( "Close" ) ) imguigml_close_current_popup();
					imguigml_same_line();
					imguigml_text( concat( "Tracker ID=", _i ) );
					imguigml_separator();
					imguigml_text( array_unpack( global.tracker_vbuffs_callstack[? _id ], NL, "" ) );
					imguigml_end_popup();
				}
				if ( imguigml_button( concat( "?##", _i ) ) ) imguigml_open_popup( concat( _i, " Pop-up" ) );
				
				imguigml_next_column();
				imguigml_text( _id );
				imguigml_next_column();
				imguigml_text( tr_vertex_details( _id, TRACE_DIV ) );
				imguigml_next_column();
			}
			#endregion
		break;
		case E_TRACKER_PAGE.INSTANCES:
			#region INSTANCES
			imguigml_text( "INSTANCES" );
			imguigml_same_line();
			if imguigml_button( "Dump" ) trace_f( tr_instance_dump() );
			imguigml_same_line();
			if imguigml_button( "Copy to clipboard" ) { clipboard_set_text( tr_instance_dump() ); imguigml_popup( "", "Copied to clipboard!" ); }
			imguigml_separator();
			imguigml_columns( 3, "Columns", true );
			imguigml_next_column();
			imguigml_text( "GM" );
			imguigml_next_column();
			imguigml_text( "details" );
			imguigml_next_column();
			imguigml_separator();
			
			var _size = ds_list_size( global.tracker_instances );
			for( var _i = 0; _i < _size; _i++ ) {
				var _id = global.tracker_instances[| _i ];
				
				if ( imguigml_begin_popup( concat( _i, " Pop-up" ) ) ) {
					if ( imguigml_button( "Close" ) ) imguigml_close_current_popup();
					imguigml_same_line();
					imguigml_text( concat( "Tracker ID=", _i ) );
					imguigml_separator();
					imguigml_text( array_unpack( global.tracker_instances_callstack[? _id ], NL, "" ) );
					imguigml_end_popup();
				}
				if ( imguigml_button( concat( "?##", _i ) ) ) imguigml_open_popup( concat( _i, " Pop-up" ) );
				
				imguigml_next_column();
				imguigml_text( instance_exists(_id)?(object_get_name(_id.object_index)+":"+string(_id)):"<destroyed?>:"+string(_id) );
				imguigml_next_column();
				imguigml_text( tr_instance_details( _id, TRACE_DIV ) );
				imguigml_next_column();
			}
			#endregion
		break;
	}
	
	if ( !window_has_set_columns ) {
		window_has_set_columns = true;
		if ( window_page != E_TRACKER_PAGE.HOME )
		&& ( window_page != E_TRACKER_PAGE.GRIPS )
		&& ( window_page != E_TRACKER_PAGE.OUTPUT )
		&& ( window_page != E_TRACKER_PAGE.SURFACE_PREVIEW ) {
			imguigml_set_column_width( 0, TRACKER_ID_SPACE_PADDING*( (window_page != E_TRACKER_PAGE.SURFACES)? 10 : 20 ) );
			if ( window_page != E_TRACKER_PAGE.INSTANCES ) {
				imguigml_set_column_width( 1, TRACKER_ID_SPACE_PADDING*15 );
			} else {
				imguigml_set_column_width( 1, 210 );
			}
		}
	}
	
	imguigml_end();
	
}