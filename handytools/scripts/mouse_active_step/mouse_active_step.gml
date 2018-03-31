///mouse_active_step()

if ( !instance_exists( obj_player ) ) exit;

var _dist = point_distance( x, y, obj_player.x, obj_player.y );

mouse_over = false;
mouse_clicked = false;

if ( ( global.click_instance_over == id ) && !imguigml_any_window_open( [obj_editor] ) && ( !editor_is_open() || editor_is_collapsed() ) && ( instance_exists( obj_player ) ) )
&& ( ( _dist < mouse_range ) || editor_is_open() ) {
    if ( mouse_glow == 0 ) mouse_glow_start = current_time;
    mouse_over = true;
}

if ( mouse_over ) {
    mouse_glow = 0.5 + 0.5*dsin( ( current_time - mouse_glow_start )/2 );
    if ( mouse_check_button_pressed( mb_left ) ) {
        mouse_down = true;
    } else if ( mouse_down && !mouse_check_button( mb_left ) ) {
        mouse_clicked = true;
        mouse_down = false;
    }
} else {
    mouse_glow = 0;
    mouse_down = false;
}

if ( mouse_over && mouse_check_button_pressed( mb_right ) && ( editor_get_page() == E_EDITOR_PAGE.DELETE ) && ( mouse_selected || obj_editor.delete_fast ) ) tr_instance_destroy();

if ( mouse_clicked ) {
    if editor_is_open() {
        
        mouse_selected = !mouse_selected;
        
        if ( mouse_selected ) {
            mouse_relative_x = x - obj_camera.x;
            mouse_relative_y = y - obj_camera.y;
            mouse_relative_z = z - obj_camera.z;
            mouse_relative_angle = image_angle - point_direction( x, y, obj_camera.x, obj_camera.y );
        }
        
        if ( mouse_selected ) && ( editor_get_page() == E_EDITOR_PAGE.PLACE ) {
            
            var _x = obj_camera.x + lengthdir_x( 30, obj_camera.look_xy_angle );
            var _y = obj_camera.y + lengthdir_y( 30, obj_camera.look_xy_angle );
            
            mouse_selected = false;
            var _inst = tr_instance_create_z( _x, _y, z, image_angle, object_index );
            with( _inst ) {
                mouse_selected = true;
                mouse_active_set_relative_values();
            }
            editor_set_page( E_EDITOR_PAGE.MOVE );
            
        }
        
    }
}

if editor_is_open() {
    
    mouse_clicked = false;
    if ( mouse_selected ) {
        
        if ( editor_get_page() == E_EDITOR_PAGE.MOVE ) {
            
            if ( !mouse_check_button( mb_right ) ) {
                x = mouse_relative_x + obj_camera.x;
                y = mouse_relative_y + obj_camera.y;
                z = mouse_relative_z + obj_camera.z;
            } else {
                mouse_active_set_relative_values();
            }
            
        } else if ( editor_get_page() == E_EDITOR_PAGE.ROTATE ) {
            
            if ( !mouse_check_button( mb_right ) ) {
                image_angle = mouse_relative_angle + point_direction( x, y, obj_camera.x, obj_camera.y );
            } else {
                mouse_active_set_relative_values();
            }
            
        }
        
    }
    
} else {
    
    if ( !mouse_interactible ) mouse_clicked = false;
    mouse_selected = false;
    
}