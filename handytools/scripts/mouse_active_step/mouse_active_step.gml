///mouse_active_step()

var _dist = point_distance( x, y, obj_player.x, obj_player.y );

mouse_over = false;
mouse_clicked = false;

if ( instance_exists( obj_player ) ) and ( obj_screen.click_instance_over == id ) and ( ( _dist < mouse_range ) or global.game_editing or ( ( object_index == obj_phone ) and obj_screen.click_through_mirror and ( global.game_room == 4 ) ) ) {
    if ( mouse_glow == 0 ) mouse_glow_start = current_time;
    mouse_over = true;
}

if ( mouse_over ) {
    mouse_glow = 0.5 + 0.5*dsin( ( current_time - mouse_glow_start )/2 );
    if ( mouse_check_button_pressed( mb_left ) ) {
        mouse_down = true;
    } else if ( mouse_down ) and ( !mouse_check_button( mb_left ) ) {
        mouse_clicked = true;
        mouse_down = false;
    }
} else {
    mouse_glow = 0;
    mouse_down = false;
}

if ( mouse_clicked ) {
    if ( global.game_editing ) {
        
        if ( object_index == obj_light ) and ( global.debug_tool == e_tool.light ) {
            range = get_integer( "range?", range );
            var _red   = get_integer( "red?"  , colour_get_red(   colour ) );
            var _green = get_integer( "green?", colour_get_green( colour ) );
            var _blue  = get_integer( "blue?" , colour_get_blue(  colour ) );
            colour = make_colour_rgb( _red, _green, _blue );
        }
        
        if ( global.debug_tool == e_tool.delete ) and ( mouse_selected ) tr_instance_destroy();
        
        mouse_selected = !mouse_selected;
        
        if ( mouse_selected ) {
            mouse_relative_x = x - obj_camera.x;
            mouse_relative_y = y - obj_camera.y;
            mouse_relative_z = z - obj_camera.z;
            mouse_relative_angle = image_angle - point_direction( x, y, obj_camera.x, obj_camera.y );
        }
        
        if ( mouse_selected ) and ( global.debug_tool == e_tool.place ) {
            
            var _x = obj_camera.x + lengthdir_x( 30, obj_camera.look_xy_angle );
            var _y = obj_camera.y + lengthdir_y( 30, obj_camera.look_xy_angle );
            
            mouse_selected = false;
            var _inst = tr_instance_create_z( _x, _y, z, image_angle, object_index );
            with( _inst ) {
                mouse_selected = true;
                mouse_active_set_relative_values()
            }
            global.debug_tool = e_tool.move;
        }
        
    }
}

if ( global.game_editing ) {
    
    mouse_clicked = false;
    if ( mouse_selected ) {
        
        if ( global.debug_tool == e_tool.move ) {
            
            x = mouse_relative_x + obj_camera.x;
            y = mouse_relative_y + obj_camera.y;
            z = mouse_relative_z + obj_camera.z;
            
        } else if ( global.debug_tool == e_tool.rotate ) {
            
            image_angle = mouse_relative_angle + point_direction( x, y, obj_camera.x, obj_camera.y );
            
        }
        
    }
    
} else {
    
    if ( !mouse_interactible ) mouse_clicked = false;
    mouse_selected = false;
    
}