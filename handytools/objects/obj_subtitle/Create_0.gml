persistent = true;

alpha_t = 0;
alpha_animate = true;
alpha_anim_speed = 0.02;
alpha_direction = 1;

speech_started = false;
speech_finished = false;
speech_list = ds_list_create();
speech_last_sound = noone;
speech_word_index = 0;

speech_last_word_time = current_time;
speech_last_word_triggered = false;

if ( instance_find( obj_subtitle, 0 ) != id ) instance_destroy();