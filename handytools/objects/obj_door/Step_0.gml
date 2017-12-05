event_inherited();

if ( mouse_clicked ) and ( !obj_gameflow.transition_do ) {
    
    audio_play_sound( snd_door_open, 1, false );
    with( obj_gameflow ) {
        transition_do = true;
        transition_t = 0;
        transition_direction = 1;
        transition_action = e_transition.next_room;
        transition_colour = c_black;
    }
    
}

//Animation handling
if ( intro_animate ) {
    intro_t = clamp( intro_t + intro_anim_speed, 0, 1 );
    if ( intro_t >= 1 ) {
        intro_animate = false;
        mouse_interactible = true;
    }
}