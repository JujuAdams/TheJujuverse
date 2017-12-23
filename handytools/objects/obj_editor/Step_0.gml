preview_surface = tr_surface_check_auto( preview_surface );

if ( IMGUI_ON && keyboard_check_pressed( vk_f11 ) ) {
	window_show = !window_show;
	window_state[1] = window_show;
	if ( window_show ) {
		window_has_set_size = false;
		window_page_return = window_page;
	}
}
if ( !instance_exists( obj_imgui ) ) window_show = false;
if ( window_show && keyboard_check_released( vk_space ) ) window_collapsed = !window_collapsed;

#region PLACEMENT COORDS
if ( instance_exists( obj_camera ) ) {
	place_x = obj_camera.x + lengthdir_x( 30, obj_camera.look_xy_angle );
	place_y = obj_camera.y + lengthdir_y( 30, obj_camera.look_xy_angle );
	place_z = obj_camera.z;
	place_a = 180 - obj_camera.look_xy_angle;
}
#endregion

var _last_instances_over = instances_over;
instances_over = noone;

#region WINDOW OPEN
if ( window_show ) {
	
	#region KEYBOARD SHORTCUTS
	if ( keyboard_check( vk_shift ) ) {
		if ( keyboard_check_released( ord("1") ) ) window_page = E_EDITOR_PAGE.HOME;
		if ( keyboard_check_released( ord("2") ) ) window_page = E_EDITOR_PAGE.PLACE;
		if ( keyboard_check_released( ord("3") ) ) window_page = E_EDITOR_PAGE.INSTANCES;
		if ( keyboard_check_released( ord("4") ) ) {
			window_page = E_EDITOR_PAGE.MOVE;
			with( obj_par_3d ) mouse_active_set_relative_values();
		}
		if ( keyboard_check_released( ord("5") ) ) {
			window_page = E_EDITOR_PAGE.ROTATE;
			with( obj_par_3d ) mouse_active_set_relative_values();
		}
		if ( keyboard_check_released( ord("6") ) ) window_page = E_EDITOR_PAGE.DELETE;
		if ( keyboard_check_released( ord("7") ) ) window_page = E_EDITOR_PAGE.LIGHT;
	}
	
	if ( keyboard_check_released( vk_tab ) ) {
		var _ = window_page;
		window_page = window_page_return;
		window_page_return = _;
		if ( window_page == E_EDITOR_PAGE.MOVE ) || ( window_page == E_EDITOR_PAGE.ROTATE ) with( obj_par_3d ) mouse_active_set_relative_values();
	}
	
	if ( keyboard_check_released( vk_control ) ) with( obj_par_3d ) mouse_selected = false;
	#endregion
	
	imguigml_set_next_window_collapsed( window_collapsed );
	window_state = imguigml_begin( window_name, true,
	                               EImGui_WindowFlags.NoResize |
	                               EImGui_WindowFlags.NoMove |
	                               EImGui_WindowFlags.MenuBar );
	if ( !window_state[1] ) {
		window_show = false;
		window_has_set_size = false;
	}
	window_state[0] = window_collapsed;
	
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
	
	if ( !window_collapsed ) {
		
		#region TABS
		imguigml_begin_menu_bar();
		if ( imguigml_menu_item( "1.Home"      ) ) window_page = E_EDITOR_PAGE.HOME;
		if ( imguigml_menu_item( "2.Place"     ) ) window_page = E_EDITOR_PAGE.PLACE;
		if ( imguigml_menu_item( "3.Instances" ) ) window_page = E_EDITOR_PAGE.INSTANCES;
		if ( imguigml_menu_item( "4.Move"      ) ) {
			window_page = E_EDITOR_PAGE.MOVE;
			with( obj_par_3d ) mouse_active_set_relative_values();
		}
		if ( imguigml_menu_item( "5.Rotate"    ) ) {
			window_page = E_EDITOR_PAGE.ROTATE;
			with( obj_par_3d ) mouse_active_set_relative_values();
		}
		if ( imguigml_menu_item( "6.Delete"    ) ) window_page = E_EDITOR_PAGE.DELETE;
		if ( imguigml_menu_item( "7.Light"     ) ) window_page = E_EDITOR_PAGE.LIGHT;
		imguigml_end_menu_bar();
		#endregion
		
		switch( editor_get_page() ) {
			case E_EDITOR_PAGE.HOME:
			#region HOME
				
				imguigml_text( "AMIASP Editor" );
				imguigml_text( TITLE + ", " + VERSION + " " + QU + VERSION_NOMIKER + QU );
				imguigml_text( "Built " + DATE + " by " + BUILDER );
				imguigml_new_line();
				imguigml_text( "F11 = Open/Close editor window" );
				imguigml_text( "Space = Collapse window" );
				imguigml_text( "Shift = Move slow" );
				imguigml_text( "Q/E = Ascend/descend" );
				imguigml_text( "Left Click/Right Click = Context sensitive" );
				imguigml_text( "Control = Deselect all" );
				imguigml_text( "Shift+Num = Select tool (or click on the tabs)" );
				imguigml_text( "Tab = Return to previous tool" );
				imguigml_new_line();
				
				#region EDITOR TOGGLES
				if ( imguigml_checkbox( "Fly"          , global.do_fly         ) ) global.do_fly         = !global.do_fly;
				imguigml_same_line();
				if ( imguigml_checkbox( "Noclip"       , global.do_noclip      ) ) global.do_noclip      = !global.do_noclip;
				imguigml_same_line();
				if ( imguigml_checkbox( "Click Surface", global.show_click     ) ) global.show_click     = !global.show_click;
				imguigml_same_line();
				if ( imguigml_checkbox( "Lighting"     , global.do_lighting    ) ) global.do_lighting    = !global.do_lighting;
				imguigml_same_line();
				if ( imguigml_checkbox( "Culling"      , global.do_culling     ) ) global.do_culling     = !global.do_culling;
				imguigml_same_line();
				if ( imguigml_checkbox( "Show Context Hints"   , show_hints            ) ) show_hints            = !show_hints;
				imguigml_same_line();
				if ( imguigml_checkbox( "Show Selected Details", show_selected_readout ) ) show_selected_readout = !show_selected_readout;
				imguigml_separator();
				#endregion
				
				#region CUSTOM TOGGLES
				imguigml_new_line();
				if ( imguigml_checkbox( "Menu", instance_exists( obj_menu ) ) ) {
				    tr_instance_destroy( obj_subtitle );
				    if ( instance_exists( obj_menu ) ) tr_instance_destroy( obj_menu ) else tr_instance_create( 0, 0, obj_menu );
				}
				imguigml_same_line();
				if ( imguigml_checkbox( "Draw Walls"   , global.do_walls      ) ) global.do_walls      = !global.do_walls;
				imguigml_same_line();
				if ( imguigml_checkbox( "Draw Ceiling" , global.do_ceiling    ) ) global.do_ceiling    = !global.do_ceiling;
				imguigml_same_line();
				if ( imguigml_checkbox( "Show Spawners", global.show_spawners ) ) global.show_spawners = !global.show_spawners;
				imguigml_same_line();
				if ( imguigml_checkbox( "Dither"       , global.do_dither     ) ) global.do_dither     = !global.do_dither;
				imguigml_new_line();
				#endregion
				
				#region ROOM DIMENSIONS / TEXTURES
				if ( imguigml_begin_popup( "Floor Pop-up" ) ) {
					
				    if ( imguigml_button( "Cancel" ) ) imguigml_close_current_popup();
					imguigml_separator();
					
					var _size = ds_list_size( floor_sprite_list );
					for( var _i = 0; _i < _size; _i++ ) {
						if ( imguigml_button( sprite_get_name( floor_sprite_list[| _i ] ) ) ) {
				            with( obj_floor ) {
				                sprite = other.floor_sprite_list[| _i ];
				                texture = sprite_get_texture( sprite, 0 );
				            }
							imguigml_close_current_popup();
						}
					}
					
				    imguigml_end_popup();
				}
				
				if ( imguigml_begin_popup( "Wall Pop-up" ) ) {
					
				    if ( imguigml_button( "Cancel" ) ) imguigml_close_current_popup();
					imguigml_separator();
					
					var _size = ds_list_size( wall_sprite_list );
					for( var _i = 0; _i < _size; _i++ ) {
						if ( imguigml_button( sprite_get_name( wall_sprite_list[| _i ] ) ) ) {
				            with( obj_wall ) {
				                sprite = other.wall_sprite_list[| _i ];
				                texture = sprite_get_texture( sprite, 0 );
				            }
							imguigml_close_current_popup();
						}
					}
					
				    imguigml_end_popup();
				}
				
				if ( imguigml_button( "Set Floor Sprite" ) ) imguigml_open_popup( "Floor Pop-up" );
				imguigml_same_line( 0, 40 );
				if ( imguigml_button( "Set Wall Sprite"  ) ) imguigml_open_popup( "Wall Pop-up"  );
				
	            var _w = 0;
	            var _h = 0;
	            var _d = 0;
				
	            with( obj_ceiling ) {
	                _w = x2 - x1;
	                _h = y2 - y1;
	                _d = z;
	            }
				
				var _any = false;
				imguigml_push_item_width( 100 );
				imguigml_same_line( 0, 40 );
				var _result = imguigml_input_float( "Width" , _w, 1, 5, 0 ); _w = _result[1]; _any |= _result[0];
				imguigml_same_line( 0, 40 );
				    _result = imguigml_input_float( "Height", _h, 1, 5, 0 ); _h = _result[1]; _any |= _result[0];
				imguigml_same_line( 0, 40 );
				    _result = imguigml_input_float( "Depth" , _d, 1, 5, 0 ); _d = _result[1]; _any |= _result[0];
				imguigml_pop_item_width();
				
				if ( _any ) {
		            with( obj_floor ) tr_instance_destroy();
		            with( obj_ceiling ) tr_instance_destroy();
		            with( obj_wall ) tr_instance_destroy();
		            define_wall(    0,  0,  0,   _w,  0, _d,   spr_tex_wall6  );
		            define_wall(    0,  0,  0,    0, _h, _d,   spr_tex_wall6  );
		            define_wall(   _w,  0,  0,   _w, _h, _d,   spr_tex_wall6  );
		            define_wall(    0, _h,  0,   _w, _h, _d,   spr_tex_wall6  );
		            define_floor(   0,  0, _w,   _h,  0, 32,   spr_tex_floor1 );
		            define_ceiling( 0,  0, _w,   _h, _d, 32,   spr_tex_white  );
				}
				#endregion
				
				#region NAVIGATION
				imguigml_new_line();
				imguigml_separator();
				imguigml_new_line();
				imguigml_text( concat( "Room ", global.game_room ) );
			
				imguigml_same_line();
				if ( imguigml_button( "Previous Room" ) ) {
					unload_current_room();
					global.game_room--;
				    if ( !load_room_n( global.game_room ) ) {
				        trace_error( "Could not load room " + string( global.game_room ) );
				        global.game_room++;
				        load_room_n( global.game_room );
				    }
				}
				imguigml_same_line();
				if ( imguigml_button( "Next Room" ) ) {
					unload_current_room();
					global.game_room++;
				    if ( !load_room_n( global.game_room ) ) {
				        trace_error( "Could not load room " + string( global.game_room ) );
				        global.game_room--;
				        load_room_n( global.game_room );
				    }
				}
				imguigml_same_line();
				if ( imguigml_button( "Save Room" ) ) {
			        var _filename = get_save_filename( "JSON|*.json", "room " + string( global.game_room ) + ".json" );
			        if ( _filename != "" ) {
			            var _file = file_text_open_write( _filename );
			            file_text_write_string( _file, room_encode() );
			            file_text_close( _file );
			            trace_loud( _filename + " SAVED!" );
			        }
				}
				#endregion
				
				#region APPLICATION SURFACE
				
				imguigml_new_line();
				imguigml_new_line();
				imguigml_push_item_width( 120 );
				var _result = imguigml_input_float( "App Surf Width" , global.app_surf_w, 1, 5, 0 );
				if ( _result[0] ) global.app_surf_w = _result[1];
				imguigml_same_line( 0, 60 );
				var _result = imguigml_input_float( "App Surf Height", global.app_surf_h, 1, 5, 0 );
				if ( _result[0] ) global.app_surf_h = _result[1];
				imguigml_pop_item_width();
				
				#endregion
				
			#endregion
			break;
			case E_EDITOR_PAGE.PLACE:
			#region PLACE
				imguigml_columns( 2, "Columns", true );
				
				imguigml_new_line();
				imguigml_image( surface_get_texture( preview_surface ), 600, 600 );
				if ( imguigml_button( "Deselect placement object" ) ) selected_object = undefined;
				imguigml_next_column();
				
				imguigml_begin_child( "child" );
			
				preview_object = undefined;
				var _size = ds_list_size( object_list );
				for( var _i = 0; _i < _size; _i++ ) {
				
					var _object = object_list[| _i ];
				
					if ( is_real( _object ) ) {
						if ( imguigml_radio_button( object_get_pretty_name( _object ), false, selected_object != _object ) ) selected_object = ( selected_object == _object )? undefined : _object;
						if ( imguigml_is_item_hovered( true ) ) preview_object = _object;
					} else if ( _object = "SEP" ) {
						imguigml_separator();
					} else {
						imguigml_text( object_list[| _i ] );
					}
				
					imguigml_next_column();
				
				}
				imguigml_end_child( "child" );
				
				imguigml_set_column_width( 0, 620 );
			
			#endregion
			break;
			case E_EDITOR_PAGE.MOVE:
			case E_EDITOR_PAGE.ROTATE:
			#region MOVE
				imguigml_text( "Filtering by selected" );
				imguigml_new_line();
				
				imguigml_columns( 5, "Columns", true );
				imguigml_text( "Object" );
				imguigml_next_column();
				imguigml_text( "x" );
				imguigml_next_column();
				imguigml_text( "y" );
				imguigml_next_column();
				imguigml_text( "z" );
				imguigml_next_column();
				imguigml_text( "angle" );
				imguigml_next_column();
				imguigml_separator();
				
				with( obj_par_3d ) {
					if ( !mouse_selected ) continue;
					
					var _fine_step = 0.1;
					var _coarse_step = 2;
					if ( imguigml_checkbox( concat( object_get_pretty_name( object_index ), ":", id ), mouse_selected ) ) mouse_selected = !mouse_selected;
					
					imguigml_next_column();
					var _result = imguigml_input_float( concat( "##x", id ), x, _fine_step, _coarse_step, 1 ); if ( _result[0] ) x = _result[1];
					imguigml_next_column();
					var _result = imguigml_input_float( concat( "##y", id ), y, _fine_step, _coarse_step, 1 ); if ( _result[0] ) y = _result[1];
					imguigml_next_column();
					var _result = imguigml_input_float( concat( "##z", id ), z, _fine_step, _coarse_step, 1 ); if ( _result[0] ) z = _result[1];
					imguigml_next_column();
					var _result = imguigml_input_float( concat( "##a", id ), image_angle, _fine_step, _coarse_step, 1 ); if ( _result[0] ) image_angle = _result[1];
					imguigml_next_column();
				}
			#endregion
			break;
			case E_EDITOR_PAGE.INSTANCES:
			#region INSTANCES
				
				ds_list_clear( instances_object_list );
				var _any = false;
				with( obj_par_3d ) {
					if ( ds_list_find_index( other.instances_object_list, object_index ) < 0 ) ds_list_add( other.instances_object_list, object_index );
					if ( mouse_selected ) _any = true;
				}
				
				if ( imguigml_begin_popup( "Object Filter Pop-up" ) ) {
					
				    if ( imguigml_button( "Cancel" ) ) imguigml_close_current_popup();
				    if ( imguigml_button( "None" ) ) {
						instances_object_filter = undefined;
						imguigml_close_current_popup();
					}
					imguigml_separator();
					
					var _size = ds_list_size( instances_object_list );
					for( var _i = 0; _i < _size; _i++ ) {
						if ( imguigml_button( object_get_pretty_name( instances_object_list[| _i ] ) ) ) {
							instances_object_filter = instances_object_list[| _i ];
							imguigml_close_current_popup();
						}
					}
					
				    imguigml_end_popup();
				}
				
				if ( imguigml_checkbox( "Filter by selected", instances_selected_filter ) ) instances_selected_filter = !instances_selected_filter;
				imguigml_same_line();
				if ( instances_object_filter == undefined ) {
					if ( imguigml_button( "Filter by object" ) ) imguigml_open_popup( "Object Filter Pop-up" );
				} else {
					if ( imguigml_button( "Filtering by " + object_get_pretty_name( instances_object_filter ) ) ) imguigml_open_popup( "Object Filter Pop-up" );
				}
				imguigml_same_line();
				if ( imguigml_button( "Select all" ) ) {
					with( obj_par_3d ) {
						if ( other.instances_selected_filter && !mouse_selected ) continue;
						if ( other.instances_object_filter != undefined ) && ( object_index != other.instances_object_filter ) continue;
						mouse_selected = true;
					}
				}
				imguigml_same_line();
				if ( imguigml_button( "Deselect all" ) ) {
					with( obj_par_3d ) {
						if ( other.instances_selected_filter && !mouse_selected ) continue;
						if ( other.instances_object_filter != undefined ) && ( object_index != other.instances_object_filter ) continue;
						mouse_selected = false;
					}
				}
				imguigml_new_line();
				
				imguigml_columns( 5, "Columns", true );
				imguigml_text( "Object" );
				imguigml_next_column();
				imguigml_text( "x" );
				imguigml_next_column();
				imguigml_text( "y" );
				imguigml_next_column();
				imguigml_text( "z" );
				imguigml_next_column();
				imguigml_text( "angle" );
				imguigml_next_column();
				imguigml_separator();
				
				with( obj_par_3d ) {
					if ( other.instances_selected_filter && !mouse_selected ) continue;
					if ( other.instances_object_filter != undefined ) && ( object_index != other.instances_object_filter ) continue;
					
					var _fine_step = 0;
					var _coarse_step = 0;
					if ( mouse_selected ) {
						_fine_step = 0.1;
						_coarse_step = 2;
					}
					
					if ( imguigml_checkbox( concat( object_get_pretty_name( object_index ), ":", id ), mouse_selected ) ) mouse_selected = !mouse_selected;
					if ( imguigml_is_item_hovered( true ) ) {
						other.instances_over = id;
						_fine_step = 0.1;
						_coarse_step = 2;
					}
					
					imguigml_next_column();
					var _result = imguigml_input_float( concat( "##x", id ), x, _fine_step, _coarse_step, 1 ); if ( _result[0] ) x = _result[1];
					imguigml_next_column();
					var _result = imguigml_input_float( concat( "##y", id ), y, _fine_step, _coarse_step, 1 ); if ( _result[0] ) y = _result[1];
					imguigml_next_column();
					var _result = imguigml_input_float( concat( "##z", id ), z, _fine_step, _coarse_step, 1 ); if ( _result[0] ) z = _result[1];
					imguigml_next_column();
					var _result = imguigml_input_float( concat( "##a", id ), image_angle, _fine_step, _coarse_step, 1 ); if ( _result[0] ) image_angle = _result[1];
					imguigml_next_column();
				}
				
				imguigml_set_column_width( 0, 220 );
				
			#endregion
			break;
			case E_EDITOR_PAGE.DELETE:
			#region DELETE
				
				if ( imguigml_begin_popup( "Confirm Pop-up" ) ) {
				    if ( imguigml_button( "Cancel" ) ) imguigml_close_current_popup();
					imguigml_separator();
					if ( imguigml_button( "Delete All" ) ) with( obj_par_3d ) if ( mouse_selected ) tr_instance_destroy();
				    imguigml_end_popup();
				}
				
				imguigml_text( "Filtering by selected" );
				imguigml_same_line();
				if ( imguigml_checkbox( "Can right-click delete without selecting the instance", delete_fast ) ) delete_fast = !delete_fast;
				imguigml_same_line( 0, 150 );
				if ( imguigml_button( "Delete All Selected" ) ) imguigml_open_popup( "Confirm Pop-up" );
				imguigml_new_line();
				
				imguigml_columns( 6, "Columns", true );
				imguigml_text( "Object" );
				imguigml_next_column();
				imguigml_text( "x" );
				imguigml_next_column();
				imguigml_text( "y" );
				imguigml_next_column();
				imguigml_text( "z" );
				imguigml_next_column();
				imguigml_text( "angle" );
				imguigml_next_column();
				imguigml_text( "Delete" );
				imguigml_next_column();
				imguigml_separator();
				with( obj_par_3d ) {
					if ( mouse_selected ) {
						if ( imguigml_checkbox( concat( object_get_pretty_name( object_index ), ":", id ), mouse_selected ) ) mouse_selected = !mouse_selected;
						imguigml_next_column();
						imguigml_text( x );
						imguigml_next_column();
						imguigml_text( y );
						imguigml_next_column();
						imguigml_text( z );
						imguigml_next_column();
						imguigml_text( image_angle );
						imguigml_next_column();
						if ( imguigml_button( "X" ) ) tr_instance_destroy( id );
						imguigml_next_column();
					}
				}
					
			#endregion
			break;
			case E_EDITOR_PAGE.LIGHT:
			#region LIGHT
				imguigml_text( "SELECTED" );
				var _any = false;
				with( obj_light ) if ( mouse_selected ) _any = true;
				if ( _any ) {
					imguigml_columns( 6, "Columns", true );
					imguigml_text( "Instance" );
					imguigml_next_column();
					imguigml_text( "x" );
					imguigml_next_column();
					imguigml_text( "y" );
					imguigml_next_column();
					imguigml_text( "z" );
					imguigml_next_column();
					imguigml_text( "colour" );
					imguigml_next_column();
					imguigml_text( "range" );
					imguigml_next_column();
					imguigml_separator();
					with( obj_light ) {
						if ( mouse_selected ) {
							if ( imguigml_button( concat( object_get_pretty_name( object_index ), ":", id ) ) ) mouse_selected = !mouse_selected;
							imguigml_next_column();
							imguigml_text( x );
							imguigml_next_column();
							imguigml_text( y );
							imguigml_next_column();
							imguigml_text( z );
							imguigml_next_column();
							var _result = imguigml_color_picker3( concat( "colour ", id ), colour_get_red( colour )/255, colour_get_green( colour )/255, colour_get_blue( colour )/255 );
							colour = make_colour_rgb( _result[1]*255, _result[2]*255, _result[3]*255 );
							imguigml_next_column();
							var _result = imguigml_slider_float( concat( "range ", id ), range, 10, 1000 );
							range = _result[1];
							imguigml_next_column();
							imguigml_separator();
						}
					}
					imguigml_set_column_width( 0, 130 );
					imguigml_set_column_width( 1,  70 );
					imguigml_set_column_width( 2,  70 );
					imguigml_set_column_width( 3,  70 );
					imguigml_set_column_width( 4, 300 );
				}
			#endregion
			break;
		}
		
	}
	
	imguigml_end();
	
}
#endregion

#region WINDOW COLLAPSED
if ( window_show && window_collapsed ) {
	
	switch( editor_get_page() ) {
	
		case E_EDITOR_PAGE.PLACE:
			#region SPAWNING
		
			if ( instance_exists( obj_camera ) )
			&& ( mouse_check_button_released( mb_right ) )
			&& ( selected_object != undefined ) {
				with( tr_instance_create_z( place_x, place_y, place_z, place_a, selected_object ) ) {
					mouse_selected = true;
					mouse_active_set_relative_values();
				}
				editor_set_page( E_EDITOR_PAGE.MOVE );
			}
			
			#endregion
		break;
		
	}

}
#endregion

#region PREVIEW INSTANCE HANDLING
if instance_exists( preview_instance ) && ( preview_instance.object_index != preview_object ) {
	tr_instance_destroy( preview_instance );
	preview_instance = noone;
}
			
if ( preview_object != undefined ) && !instance_exists( preview_instance ) {
	preview_instance = tr_instance_create_z( 0, 0, 0, 0, preview_object );
	preview_instance.visible = false;
}
		
with( preview_instance ) image_angle += 0.8;
#endregion

#region SELECTED INSTANCE HANDLING
			
if ( instance_exists( selected_instance ) && ( selected_instance.object_index != selected_object ) ) {
	tr_instance_destroy( selected_instance );
	selected_instance = noone;
}
			
if ( selected_object != undefined ) && !instance_exists( selected_instance ) {
	selected_instance = tr_instance_create_z( 0, 0, 0, 0, selected_object );
	selected_instance.visible = false;
}
			
with( selected_instance ) image_angle += 0.8;
#endregion