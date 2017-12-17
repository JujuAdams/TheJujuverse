event_inherited();

if ( mouse_clicked ) {
    if ( headset_direction <= 0 ) {
        audio_play_sound_on( emitter, snd_phone_up, false, 1 );
        headset_direction = 1;
        headset_animate = true;
        phone_ring_do = false;
        with( obj_subtitle ) {
            alpha_animate = true;
            alpha_direction = -1;
        }
    } else {
        headset_direction = -1;
        headset_animate = true;
        with( obj_subtitle ) {
            alpha_animate = true;
            alpha_direction = -1;
        }
    }
}

if ( phone_ring_do ) {
    if ( phone_ring_do_delay ) {
        if ( current_time > phone_ring_last_time + phone_ring_delay ) {
            phone_ring_sound_instance = audio_play_sound_on( emitter, snd_phone_ring, false, 1 );
            phone_ring_do_delay = false;
        }
    } else {
        if ( !audio_is_playing( phone_ring_sound_instance ) ) {
            phone_ring_do_delay = true;
            phone_ring_last_time = current_time;
        }
    }
} else {
    audio_stop_sound( phone_ring_sound_instance );
}

///Animation handling

if ( headset_animate ) {
    headset_t = clamp( headset_t + headset_anim_speed*headset_direction, 0, 1 );
    if ( headset_t <= 0 ) && ( headset_direction < 0 ) {
        audio_play_sound_on( emitter, snd_phone_down, false, 1 );
        headset_animate = false;
        with( obj_door ) intro_animate = true;
    }
    if ( headset_t >= 1 ) && ( headset_direction > 0 ) {
        headset_animate = false;
    }
}