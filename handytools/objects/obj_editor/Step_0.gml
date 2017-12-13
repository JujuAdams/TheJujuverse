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
	
	if ( keyboard_check_released( ord("1") ) ) window_page = E_EDITOR_PAGE.HOME;
	if ( keyboard_check_released( ord("2") ) ) window_page = E_EDITOR_PAGE.PLACE;
	if ( keyboard_check_released( ord("3") ) ) {
		window_page = E_EDITOR_PAGE.MOVE;
		with( obj_par_3d ) mouse_active_set_relative_values();
	}
	if ( keyboard_check_released( ord("4") ) ) {
		window_page = E_EDITOR_PAGE.ROTATE;
		with( obj_par_3d ) mouse_active_set_relative_values();
	}
	if ( keyboard_check_released( ord("5") ) ) window_page = E_EDITOR_PAGE.INSTANCES;
	if ( keyboard_check_released( ord("6") ) ) window_page = E_EDITOR_PAGE.SELECTED;
	if ( keyboard_check_released( ord("7") ) ) window_page = E_EDITOR_PAGE.DELETE;
	if ( keyboard_check_released( ord("8") ) ) window_page = E_EDITOR_PAGE.LIGHT;
	
	if ( keyboard_check_released( vk_tab ) ) {
		var _ = window_page;
		window_page = window_page_return;
		window_page_return = _;
	}
	
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
		
		imguigml_begin_menu_bar();
		if ( imguigml_menu_item( "1.Home"      ) ) window_page = E_EDITOR_PAGE.HOME;
		if ( imguigml_menu_item( "2.Place"     ) ) window_page = E_EDITOR_PAGE.PLACE;
		if ( imguigml_menu_item( "3.Move"      ) ) {
			window_page = E_EDITOR_PAGE.MOVE;
			with( obj_par_3d ) mouse_active_set_relative_values();
		}
		if ( imguigml_menu_item( "4.Rotate"    ) ) {
			window_page = E_EDITOR_PAGE.ROTATE;
			with( obj_par_3d ) mouse_active_set_relative_values();
		}
		if ( imguigml_menu_item( "5.Instances" ) ) window_page = E_EDITOR_PAGE.INSTANCES;
		if ( imguigml_menu_item( "6.Selected"  ) ) window_page = E_EDITOR_PAGE.SELECTED;
		if ( imguigml_menu_item( "7.Delete"    ) ) window_page = E_EDITOR_PAGE.DELETE;
		if ( imguigml_menu_item( "8.Light"     ) ) window_page = E_EDITOR_PAGE.LIGHT;
		imguigml_end_menu_bar();
	
		switch( editor_get_page() ) {
			case E_EDITOR_PAGE.HOME:
			#region HOME
				
				imguigml_text( "AMIASP Editor" );
				imguigml_text( TITLE + ", " + VERSION + " " + QU + VERSION_NOMIKER + QU );
				imguigml_text( "Built " + DATE + " by " + BUILDER );
				imguigml_separator();
				imguigml_new_line();
				imguigml_text( "F11 = Open/Close editor window" );
				imguigml_text( "Space = Collapse window" );
				imguigml_text( "Tab = Return to previous tool" );
				imguigml_new_line();
				
				if ( imguigml_button( "Toggle Menu" ) ) {
				    tr_instance_destroy( obj_subtitle );
				    if ( instance_exists( obj_menu ) ) {
						tr_instance_destroy( obj_menu );
					} else {
						tr_instance_create( 0, 0, obj_menu );
					}
				}
				imguigml_same_line();
				if ( imguigml_button( "Toggle Dither" ) ) global.do_dither = !global.do_dither;
				imguigml_same_line();
				if ( imguigml_button( "Toggle Lighting" ) ) global.do_lighting = !global.do_lighting;
				imguigml_same_line();
				if ( imguigml_button( "Toggle Noclip (" + (global.do_noclip?"is ON":"is OFF") + ")" ) ) global.do_noclip = !global.do_noclip;
				imguigml_same_line();
				if ( imguigml_button( "Toggle srf_click" ) ) global.show_click = !global.show_click;
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
				imguigml_new_line();
				
				if ( imguigml_button( "Set Floor Sprite" ) && instance_exists( obj_floor ) ) {
		            var _texture_name = sprite_get_name( obj_floor.sprite );
		            _texture_name = get_string( "Texture for floor?", _texture_name );
		            if ( _texture_name != "" ) {
		                var _texture = asset_get_index( _texture_name );
		                if ( _texture < 0 ) {
		                    imguigml_popup( "Error!",_texture_name + " could not be found!" );
		                } else {
		                    with( obj_floor ) {
		                        sprite = _texture;
		                        texture = sprite_get_texture( sprite, 0 );
		                    }
		                }
		            }
				}
				imguigml_same_line();
				if ( imguigml_button( "Set Wall Sprite" ) && instance_exists( obj_wall ) ) {
		            var _texture_name = sprite_get_name( obj_wall.sprite );
		            _texture_name = get_string( "Texture for walls?", _texture_name );
		            if ( _texture_name != "" ) {
		                var _texture = asset_get_index( _texture_name );
		                if ( _texture < 0 ) {
		                    imguigml_popup( "Error!", _texture_name + " could not be found!" );
		                } else {
		                    with( obj_wall ) {
		                        sprite = _texture;
		                        texture = sprite_get_texture( sprite, 0 );
		                    }
		                }
		            }
				}
			#endregion
			break;
			case E_EDITOR_PAGE.PLACE:
			#region PLACE
				imguigml_columns( 2, "Columns", true );
				
				imguigml_new_line();
				imguigml_image( surface_get_texture( preview_surface ), 600, 600 );
				imguigml_next_column();
			
				imguigml_begin_child( "child" );
				imguigml_columns( 2, "Columns", true );
			
				preview_object = undefined;
				var _size = ds_list_size( object_list );
				for( var _i = 0; _i < _size; _i++ ) {
				
					var _object = object_list[| _i ];
				
					if ( selected_object == _object ) imguigml_text( "S" );
					imguigml_next_column();
				
					if ( is_real( _object ) ) {
						if ( imguigml_button( object_get_pretty_name( _object ) ) ) selected_object = ( selected_object == _object )? undefined : _object;
						if ( imguigml_is_item_hovered( true ) ) preview_object = _object;
					} else if ( _object = "SEP" ) {
						imguigml_separator();
					} else {
						imguigml_text( object_list[| _i ] );
					}
				
					imguigml_next_column();
				
				}
				imguigml_set_column_width( 0, 25 );
				imguigml_end_child( "child" );
			
				imguigml_set_column_width( 0, 620 );
			
			#endregion
			break;
			case E_EDITOR_PAGE.MOVE:
			case E_EDITOR_PAGE.ROTATE:
			case E_EDITOR_PAGE.SELECTED:
			#region MOVE
				imguigml_text( "SELECTED" );
				var _any = false;
				with( obj_par_3d ) if ( mouse_selected ) _any = true;
				if ( _any ) {
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
						if ( mouse_selected ) {
							imguigml_text( concat( object_get_pretty_name( object_index ), ":", id ) );
							imguigml_next_column();
							imguigml_text( x );
							imguigml_next_column();
							imguigml_text( y );
							imguigml_next_column();
							imguigml_text( z );
							imguigml_next_column();
							imguigml_text( image_angle );
							imguigml_next_column();
						}
					}
				}
			#endregion
			break;
			case E_EDITOR_PAGE.INSTANCES:
			#region INSTANCES
				imguigml_columns( 6, "Columns", true );
				imguigml_next_column();
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
					if ( mouse_selected ) imguigml_text( "S" );
					imguigml_next_column();
					if ( imguigml_button( concat( object_get_pretty_name( object_index ), ":", id ) ) ) mouse_selected = !mouse_selected;
					if ( imguigml_is_item_hovered( true ) ) other.instances_over = id;
					imguigml_next_column();
					imguigml_text( (( mouse_selected || ( _last_instances_over == id )) ? "" : "  ") + string( x ) );
					imguigml_next_column();
					imguigml_text( (( mouse_selected || ( _last_instances_over == id )) ? "" : "  ") + string( y ) );
					imguigml_next_column();
					imguigml_text( (( mouse_selected || ( _last_instances_over == id )) ? "" : "  ") + string( z ) );
					imguigml_next_column();
					imguigml_text( (( mouse_selected || ( _last_instances_over == id )) ? "" : "  ") + string( image_angle ) );
					imguigml_next_column();
				}
				imguigml_set_column_width( 0,  25 );
				imguigml_set_column_width( 1, 170 );
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