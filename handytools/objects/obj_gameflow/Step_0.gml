#region INPUT
if ( keyboard_check_pressed( vk_f4 ) ) {
    window_set_fullscreen( !window_get_fullscreen() );
    if ( !instance_exists( obj_menu ) ) {
        audio_play_sound( snd_flower, 1, false );
        tr_instance_create( 0, 0, obj_menu );
    }
}

if ( instance_exists( obj_camera ) ) and ( !instance_exists( obj_menu ) ) {
    if ( !global.mouse_locked ) global.mouse_lock_time = current_time;
    global.mouse_locked = true;
}

if ( global.mouse_locked ) and ( !imguigml_any_window_open() ) {
    
    window_set_cursor( cr_none );
    
    if ( current_time - global.mouse_lock_time > 100 ) {
        global.mouse_dx = window_mouse_get_x() - window_get_width()*0.5;
        global.mouse_dy = window_mouse_get_y() - window_get_height()*0.5;
    }
    
    window_mouse_set( window_get_width()*0.5, window_get_height()*0.5 );
    
} else {
    window_set_cursor( cr_default );
}

if ( !global.mouse_locked ) {
    
    global.mouse_dx = 0;
    global.mouse_dy = 0;
    
    if ( instance_exists( obj_camera ) ) {
        global.mouse_2d_x = obj_camera.x - 320 + 640*window_mouse_get_x()/window_get_width();
        global.mouse_2d_y = obj_camera.y - 240 + 480*window_mouse_get_y()/window_get_height();
    } else {
        global.mouse_2d_x = 0;
        global.mouse_2d_y = 0;
    }
    
}

if ( keyboard_check_pressed( vk_escape ) ) {
    tr_instance_destroy( obj_subtitle );
    if ( !instance_exists( obj_menu ) ) tr_instance_create( 0, 0, obj_menu );
}

#endregion

#region OUTRO
if ( global.game_outro_do ) {
    
    switch( global.game_outro_stage ) {
        case 0:
            if ( current_time > global.game_outro_last_event + 5500 ) {
                global.game_outro_stage++;
                global.game_outro_last_event = current_time;
                audio_play_sound( snd_skeleton_reverse, 1, false );
                with( obj_skele ) outro_animate = true;
                if ( !global.happy_ending ) with( obj_chair ) outro_animate = true;
            }
        break;
        case 1:
            if ( global.game_room == 10 ) {
                
                if ( current_time > global.game_outro_last_event + 16000 ) {
                    unload_current_room();
                    tr_instance_create( 0, 0, obj_menu );
                }
                
            } else {
                
                if ( current_time > global.game_outro_last_event + 8000 ) {
                    with( obj_gameflow ) {
                        transition_do = true;
                        transition_t = 0;
                        transition_direction = 1;
                        transition_action = e_transition.menu;
                        transition_colour = c_white;
                    }
                    global.game_outro_stage = 2;
                }
                
            }
        break;
        case 2:
        break;
    }
    
}
#endregion

#region STEP
if ( global.game_editing ) or ( global.game_room == 0 ) or ( global.game_room == 10 ) or ( global.game_room == 11 ) {
    global.game_swell = 0;
} else {
    global.game_swell = SWELL_SIZE*( 0.5 + 0.5*dsin( current_time/SWELL_TIME_FACTOR ) );
}

if ( global.game_room == 5 ) {
    if ( !instance_exists( obj_rope )
    and !instance_exists( obj_door ) ) {
        with( obj_door_spawn ) if ( door_spawn_time >= VERY_LARGE*0.5 ) door_spawn_time = current_time + 700;
    }
}

if ( global.game_room == 7 ) {
    if ( !instance_exists( obj_vase1 )
    and !instance_exists( obj_vase2 )
    and !instance_exists( obj_door ) ) {
        with( obj_door_spawn ) if ( door_spawn_time >= VERY_LARGE*0.5 ) door_spawn_time = current_time + 700;
    }
}
#endregion

#region TRANSITION
if ( transition_do ) {
    transition_t = clamp( transition_t + transition_speed*transition_direction, 0, 1 );
    if ( transition_t >= 1 ) and ( transition_direction > 0 ) {
        
        transition_do = false;
        transition_t = 0;
        
        tr_instance_destroy( obj_menu );
        
        if ( transition_action == e_transition.menu ) {
            
            if ( !instance_exists( obj_menu ) ) tr_instance_create( 0, 0, obj_menu );
            
            unload_current_room();
            global.game_room = 0;
            
            transition_do = true;
            transition_t = 1;
            transition_direction = -1;
            transition_action = e_transition.nothing;
            //transition_colour = c_black;
            
        } else if ( transition_action == e_transition.new_game ) {
            
            if ( !audio_is_playing( snd_breathing ) ) {
                var _sound = audio_play_sound( snd_breathing, 10, true );
                audio_sound_gain( _sound, 0, 0 );
                audio_sound_gain( _sound, 1, 4000 );
            }
            
            global.game_room = 0;
            global.happy_ending = false;
            load_room_n( global.game_room );
            
        } else if ( transition_action == e_transition.next_room ) {
            
            unload_current_room();
            global.game_room++;
            if ( global.game_room == 9 ) and ( global.happy_ending ) {
                
                global.game_room = 11;
                audio_play_sound( snd_skeleton, 1, false );
                audio_stop_sound( snd_breathing );
                transition_do = true;
                transition_t = 1;
                transition_direction = -1;
                transition_action = e_transition.nothing;
                transition_colour = c_black;
                
            } else if ( global.game_room < 10 ) {
                
                audio_play_sound( snd_door_close, 1, false );
                
            } else if ( global.game_room == 10 ) {
                
                audio_play_sound( snd_skeleton, 1, false );
                audio_stop_sound( snd_breathing );
                transition_do = true;
                transition_t = 1;
                transition_direction = -1;
                transition_action = e_transition.nothing;
                transition_colour = c_black;
                
            }
            
            if ( !load_room_n( global.game_room ) ) tr_instance_create( 0, 0, obj_menu );
            
        } else if ( transition_action == e_transition.end_game ) {
            unload_current_room();
            tr_instance_create( 0, 0, obj_menu );
        }
        
    }
    if ( transition_t <= 0 ) and ( transition_direction < 0 ) {
        transition_do = false;
        transition_direction = 1;
    }
}
#endregion