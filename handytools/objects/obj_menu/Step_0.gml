if ( keyboard_check_pressed( vk_escape ) ) escape_down_time = current_time;
if ( keyboard_check( vk_escape ) ) {
    if ( current_time > escape_down_time + 300 ) game_end();
}

if ( keyboard_check_pressed( vk_enter ) ) {
    
    if ( global.menu_page == 0 ) {
        
        audio_play_sound( snd_flower, 1, false );
        global.menu_page = 1;
        
    } else if ( global.menu_page == 1 ) {
        
        audio_play_sound( snd_flower, 1, false );
        global.menu_page = 2;
        
    } else if ( global.menu_page == 2 ) {
        
        audio_play_sound( snd_flower, 1, false );
        global.menu_page = 3;
        
    } else {
        
        with( obj_gameflow ) {
            if ( !transition_do ) {
                
                audio_play_sound( snd_flower, 1, false );
                
                if ( instance_exists( obj_camera ) ) {
                    transition_action = e_transition.nothing;
                    transition_do = true;
                    transition_t = 1;
                    transition_direction = 1;
                    transition_colour = c_black;
                } else {
                    transition_action = e_transition.new_game;
                    transition_do = true;
                    transition_t = 0;
                    transition_direction = 1;
                    transition_colour = c_black;
                }
                
            }
        }
        
    }
    
}