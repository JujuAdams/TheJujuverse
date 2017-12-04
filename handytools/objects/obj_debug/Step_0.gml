if ( keyboard_check_pressed( ord( "1" ) ) ) global.game_editing = !global.game_editing;
with( obj_screen ) {
    if ( keyboard_check_pressed( ord( "2" ) ) ) do_lighting = !do_lighting;
    if ( keyboard_check_pressed( ord( "3" ) ) ) do_dither   = !do_dither;
}

if ( global.game_editing ) {
    
    if ( keyboard_check_pressed( vk_add ) ) {
        unload_current_room();
        global.game_room++;
        if ( !load_room_n( global.game_room ) ) {
            show_message( "COULD NOT LOAD ROOM " + string( global.game_room ) );
            global.game_room--;
            load_room_n( global.game_room );
        }
        show_message( "LOADED ROOM " + string( global.game_room ) );
    }
    
    if ( keyboard_check_pressed( vk_subtract ) ) {
        unload_current_room();
        global.game_room--;
        if ( !load_room_n( global.game_room ) ) {
            show_message( "COULD NOT LOAD ROOM " + string( global.game_room ) );
            global.game_room++;
            load_room_n( global.game_room );
        }
        show_message( "LOADED ROOM " + string( global.game_room ) );
    }
    
    if ( keyboard_check( vk_control ) ) and ( keyboard_check_pressed( ord( "S" ) ) ) {
        var _filename = get_save_filename( "JSON|*.json", "room " + string( global.game_room ) + ".json" );
        if ( _filename != "" ) {
            var _file = file_text_open_write( _filename );
            file_text_write_string( _file, room_encode() );
            file_text_close( _file );
            show_message( _filename + " SAVED!" );
        }
    }
    
    if ( keyboard_check( vk_control ) ) and ( keyboard_check_pressed( ord( "L" ) ) ) {
        var _filename = get_open_filename( "JSON|*.json", "room " + string( global.game_room ) + ".json" );
        if ( _filename != "" ) {
            var _file = file_text_open_read( _filename );
            var _str = file_text_read_string( _file );
            file_text_close( _file );
            unload_current_room();
            room_decode( _str );
            show_message( _filename + " LOADED!" );
        }
    }
    
    if ( keyboard_check_pressed( ord( "N" ) ) ) zoom_2d = clamp( zoom_2d+1, 1, 3 );
    if ( keyboard_check_pressed( ord( "M" ) ) and ( !keyboard_check( vk_shift ) ) ) zoom_2d = clamp( zoom_2d-1, 1, 3 );
    if ( keyboard_check_pressed( vk_tab ) ) {
        global.debug_tool = ( global.debug_tool+1 ) mod e_tool.size;
        with( obj_par_3d ) mouse_active_set_relative_values();
    }
    
    if ( keyboard_check( vk_shift ) ) {
        if ( keyboard_check_pressed( ord( "P" ) ) ) global.debug_tool = e_tool.place;
        if ( keyboard_check_pressed( ord( "L" ) ) ) { global.debug_tool = e_tool.light; }
        if ( keyboard_check_pressed( ord( "M" ) ) ) { global.debug_tool = e_tool.move; with( obj_par_3d ) mouse_active_set_relative_values(); }
        if ( keyboard_check_pressed( ord( "R" ) ) ) { global.debug_tool = e_tool.rotate; with( obj_par_3d ) mouse_active_set_relative_values(); }
        if ( keyboard_check_pressed( vk_backspace ) ) global.debug_tool = e_tool.delete;
        if ( keyboard_check_pressed( ord( "T" ) ) ) global.debug_tool = e_tool.select;
        if ( keyboard_check_pressed( ord( "G" ) ) ) {
        
            var _texture_name = sprite_get_name( obj_floor.sprite );
            _texture_name = get_string( "Texture for floor?", _texture_name );
            if ( _texture_name != "" ) {
                var _texture = asset_get_index( _texture_name );
                if ( _texture < 0 ) {
                    show_message( _texture_name + " could not be found!" );
                } else {
                    with( obj_floor ) {
                        sprite = _texture;
                        texture = sprite_get_texture( sprite, 0 );
                    }
                }
            }
        
            var _texture_name = sprite_get_name( obj_wall.sprite );
            _texture_name = get_string( "Texture for walls?", _texture_name );
            if ( _texture_name != "" ) {
                var _texture = asset_get_index( _texture_name );
                if ( _texture < 0 ) {
                    show_message( _texture_name + " could not be found!" );
                } else {
                    with( obj_wall ) {
                        sprite = _texture;
                        texture = sprite_get_texture( sprite, 0 );
                    }
                }
            }
            
        }
        if ( keyboard_check_pressed( ord( "F" ) ) ) {
            
            var _w = 0;
            var _h = 0;
            var _d = 0;
            
            with( obj_ceiling ) {
                _w = x2 - x1;
                _h = y2 - y1;
                _d = z;
            }
            
            var _w = get_integer( "WIDTH?", _w );
            var _h = get_integer( "HEIGHT?", _h );
            var _d = get_integer( "DEPTH?", _d );
            
            with( obj_floor ) tr_instance_destroy();
            with( obj_ceiling ) tr_instance_destroy();
            with( obj_wall ) tr_instance_destroy();
            
            define_wall(    0,  0,  0,   _w,  0, _d,   spr_tex_wall6 );
            define_wall(    0,  0,  0,    0, _h, _d,   spr_tex_wall6 );
            define_wall(   _w,  0,  0,   _w, _h, _d,   spr_tex_wall6 );
            define_wall(    0, _h,  0,   _w, _h, _d,   spr_tex_wall6 );
            define_floor(   0, 0,   _w, _h,  0, 32, spr_tex_floor1 );
            define_ceiling( 0, 0,   _w, _h, _d, 32, spr_tex_white );
            
        }
    }
    
    if ( mouse_check_button_pressed( mb_right ) ) {
        with( obj_par_3d ) mouse_selected = false;
        
        if ( global.debug_tool == e_tool.place ) {
            
            var _x = obj_camera.x + lengthdir_x( 30, obj_camera.look_xy_angle );
            var _y = obj_camera.y + lengthdir_y( 30, obj_camera.look_xy_angle );
            
            var _name = get_string( "Please enter an object's name c:", "" );
            var _object = asset_get_index( _name );
            if ( _object > obj_par_game ) {
                
                var _inst = tr_instance_create_z( _x, _y, obj_camera.z, 180 - obj_camera.look_xy_angle, _object );
                with( _inst ) {
                    mouse_selected = true;
                    mouse_active_set_relative_values()
                }
                global.debug_tool = e_tool.move;
                
            } else {
                
                _name = "obj_" + _name;
                var _object = asset_get_index( _name );
                
                if ( _object > obj_par_game ) {
                    
                    var _inst = tr_instance_create_z( _x, _y, obj_camera.z, 180 - obj_camera.look_xy_angle, _object );
                    with( _inst ) {
                        mouse_selected = true;
                        mouse_active_set_relative_values()
                    }
                    global.debug_tool = e_tool.move;
                    
                } else {
                    
                    show_message( string_delete( _name, 1, 4 ) + " not found!" );
                    
                }
                
            }
            
        }
    }
    
}