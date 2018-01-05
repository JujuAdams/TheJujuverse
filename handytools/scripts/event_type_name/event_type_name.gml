var _str = "";

switch( event_type ) {
    
    case ev_create:  _str = "Create";  break;
    case ev_destroy: _str = "Destroy"; break;
    
    case ev_step:
        _str = "Step";
        switch( event_number ) {
            case ev_step_begin: _str += " (Begin)";  break;
            case ev_step:       _str += " (Normal)"; break;
            case ev_step_end:   _str += " (End)";    break;
        }
    break;
    
    case ev_alarm:
        _str = "Alarm " + string( event_number );
    break;
    
    case ev_keyboard:   _str = "Keyboard (Held)";    break;
    case ev_keypress:   _str = "Keyboard (Press)";   break;
    case ev_keyrelease: _str = "Keyboard (Release)"; break;
    
    case ev_mouse:
        _str = "Mouse";
        switch( event_number ) {
            case ev_left_button:      _str += " (Left Held)";       break;
            case ev_middle_button:    _str += " (Middle Held)";     break;
            case ev_right_button:     _str += " (Right Held)";      break;
            case ev_no_button:        _str += " (None Held)";       break;
            case ev_left_press:       _str += " (Left Pressed)";    break;
            case ev_middle_press:     _str += " (Middle Pressed)";  break;
            case ev_right_press:      _str += " (Right Pressed)";   break;
            case ev_left_release:     _str += " (Left Released)";   break;
            case ev_middle_release:   _str += " (Middle Released)"; break;
            case ev_right_release:    _str += " (Right Released)";  break;
            
            case ev_mouse_enter:      _str += " (Enter)";           break;
            case ev_mouse_leave:      _str += " (Leave)";           break;
            case ev_mouse_wheel_up:   _str += " (Wheel Up)";        break;
            case ev_mouse_wheel_down: _str += " (Wheel Down)";      break;
            
            case ev_global_left_button:    _str += " (Global Left Held)";       break;
            case ev_global_middle_button:  _str += " (Global Middle Held)";     break;
            case ev_global_right_button:   _str += " (Global Right Held)";      break;
            case ev_global_left_press:     _str += " (Global Left Pressed)";    break;
            case ev_global_middle_press:   _str += " (Global Middle Pressed)";  break;
            case ev_global_right_press:    _str += " (Global Right Pressed)";   break;
            case ev_global_left_release:   _str += " (Global Left Released)";   break;
            case ev_global_middle_release: _str += " (Global Middle Released)"; break;
            case ev_global_right_release:  _str += " (Global Right Released)";  break;
        }
    break;
    
    case ev_collision:
        _str = "Collision with " + string( event_number );
    break;
    
    case ev_other:
        _str = "Other";
        switch( event_number ) {
            case ev_outside:        _str += " (Outside)";        break;
            case ev_boundary:       _str += " (Boundary)";       break;
            case ev_game_start:     _str += " (Game Start)";     break;
            case ev_game_end:       _str += " (Game End)";       break;
            case ev_room_start:     _str += " (Room Start)";     break;
            case ev_room_end:       _str += " (Room End)";       break;
            case ev_no_more_lives:  _str += " (No More Lives)";  break;
            case ev_no_more_health: _str += " (No More Health)"; break;
            case ev_animation_end:  _str += " (Animation End)";  break;
            case ev_end_of_path:    _str += " (End Of Path)";    break;
            case ev_close_button:   _str += " (Close Button)";   break;
            case ev_user0:          _str += " (User 0)";         break;
            case ev_user1:          _str += " (User 1)";         break;
            case ev_user2:          _str += " (User 2)";         break;
            case ev_user3:          _str += " (User 3)";         break;
            case ev_user4:          _str += " (User 4)";         break;
            case ev_user5:          _str += " (User 5)";         break;
            case ev_user6:          _str += " (User 6)";         break;
            case ev_user7:          _str += " (User 7)";         break;
            case ev_user8:          _str += " (User 8)";         break;
            case ev_user9:          _str += " (User 9)";         break;
            case ev_user10:         _str += " (User 10)";        break;
            case ev_user11:         _str += " (User 11)";        break;
            case ev_user12:         _str += " (User 12)";        break;
            case ev_user13:         _str += " (User 13)";        break;
            case ev_user14:         _str += " (User 14)";        break;
            case ev_user15:         _str += " (User 15)";        break;
        }
    break;
    
    case ev_draw:
        _str = "Draw";
        switch( event_number ) {
            case ev_draw_begin: _str += " (Begin)";     break;
            case ev_draw_end:   _str += " (End)";       break;
            case ev_draw_pre:   _str += " (Pre)";       break;
            case ev_draw_post:  _str += " (Post)";      break;
            case ev_gui_begin:  _str += " (GUI Begin)"; break;
            case ev_gui:        _str += " (GUI)";       break;
            case ev_gui_end:    _str += " (GUI End)";   break;
            default:            _str += " (Normal)";    break;
        }
    break;
}

return _str;