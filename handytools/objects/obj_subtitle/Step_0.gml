if ( alpha_animate ) {
    alpha_t = clamp( alpha_t + alpha_anim_speed*alpha_direction, 0, 1 );
    if ( alpha_t <= 0 ) && ( alpha_direction < 0 ) {
        alpha_animate = false;
        tr_instance_destroy();
    }
    if ( alpha_t >= 1 ) && ( alpha_direction > 0 ) {
        alpha_animate = false;
    }
}

if ( keyboard_check_pressed( vk_enter ) && !instance_exists( obj_menu ) ) {
    alpha_animate = true;
    alpha_direction = -1;
}

#region SPEECH
if ( !speech_finished ) {

    if ( !speech_started ) {
        
        speech_started = true;
        var _str = text + " ";
        
        var _pos_a = string_pos( " ", _str );
        var _pos_b = string_pos( "#", _str );
        var _pos = 0;
        if ( _pos_a > 0 ) {
            if ( _pos_b > 0 ) && ( _pos_b < _pos_a ) _pos = _pos_b else _pos = _pos_a;
        } else if ( _pos_b > 0 ) {
            _pos = _pos_b;
        }
        
        while( _pos > 0 ) {
            
            ds_list_add( speech_list, string_length( string_copy( _str, 1, _pos-1 ) ) );
            _str = string_delete( _str, 1, _pos );
            
            _pos_a = string_pos( " ", _str );
            _pos_b = string_pos( "#", _str );
            _pos = 0;
            if ( _pos_a > 0 ) {
                if ( _pos_b > 0 ) && ( _pos_b < _pos_a ) _pos = _pos_b else _pos = _pos_a;
            } else if ( _pos_b > 0 ) {
                _pos = _pos_b;
            }
            
        }
        
        speech_word_index = 0;
        speech_last_word_triggered = false;
        speech_last_sound = audio_play_sound_on( obj_phone.emitter, choose_speech( speech_list[| speech_word_index ] ), false, 1 );
        audio_sound_gain( speech_last_sound, 0.2, 0 );
        
    } else {
        
        if ( !instance_exists( obj_phone ) ) {
            
            speech_finished = true;
            
        } else if ( !audio_is_playing( speech_last_sound ) ) {
            
            if ( !speech_last_word_triggered ) {
                speech_last_word_time = current_time;
                speech_last_word_triggered = true;
            }
            
            if ( ( current_time > speech_last_word_time + 90 ) && ds_exists( speech_list, ds_type_list ) ) {
                speech_word_index++;
                if ( speech_word_index >= ds_list_size( speech_list ) ) {
                    speech_finished = true;
                } else {
                    speech_last_sound = audio_play_sound_on( obj_phone.emitter, choose_speech( speech_list[| speech_word_index ] ), false, 1 );
                    audio_sound_gain( speech_last_sound, 0.3, 0 );
                    speech_last_word_triggered = false;
                }
            }
            
        }
        
        
    }
    
}
#endregion