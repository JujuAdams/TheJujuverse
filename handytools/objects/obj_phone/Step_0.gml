if ( global.game_room == 4 ) {
    mirror_room_cut_out = ( point_distance( x, y, obj_camera.x, obj_camera.y ) < 60 );
    mouse_interactible = !mirror_room_cut_out;
}


event_inherited();

if ( mouse_clicked ) {
    
    mirror_room_cut_out = false;
    
    if ( headset_direction <= 0 ) {
        headset_direction = 1;
        headset_animate = true;
        phone_ring_do = false;
        audio_play_sound_on( emitter, snd_phone_up, false, 1 );
        with( obj_dummy_phone ) phone_ring_do = false;
        with( obj_subtitle ) {
            alpha_animate = true;
            alpha_direction = -1;
        }
        with( tr_instance_create( 0, 0, obj_subtitle ) ) {
            text = global.game_text;
            scribble = scribble_create( text, display_get_gui_width(), fnt_subtitle, fa_centre );
            scribble_set_box_alignment( scribble, fa_centre, fa_middle );
            scribble_set_shader( scribble, shd_scribble_fade_char, 20 );
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

if ( phone_ring_do && !mirror_room_cut_out ) {
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
        headset_animate = false;
        if ( global.game_room == 9 ) {
            
            with( obj_door_spawn ) door_spawn_time = current_time + 5000;
            audio_play_sound_at( snd_phone_shatter, x, y, z, 100, 300, 1, false, 1 );
            
            repeat( 24 ) {
                var _inst = tr_instance_create_z( x+0.5, y+0.5, z + random_range( -2, 5 ), 0, obj_shard );
                with( _inst ) {
                    sprite = spr_tex_shard_yellow;
                    model = choose( obj_model( "shard1" ), obj_model( "shard2" ) );
                    var _angle = random( 360 );
                    var _v = random_range( 1, 3 );
                    velocity_x = lengthdir_x( _v, _angle );
                    velocity_y = lengthdir_y( _v, _angle );
                    velocity_z = random_range( 1, 4 );
                }
            }
            
            tr_instance_destroy();
            
        } else {
            
            if ( global.game_room != 5 ) && ( global.game_room != 7 ) && ( global.game_room != 8 ) {
                if ( !instance_exists( obj_door ) ) with( obj_door_spawn ) door_spawn_time = current_time + 700;
            }
            with( obj_door ) intro_animate = true;
            
            audio_play_sound_on( emitter, snd_phone_down, false, 1 );
            
        }
        
    }
    if ( headset_t >= 1 ) && ( headset_direction > 0 ) headset_animate = false;
}