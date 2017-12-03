///flower_handle()

if ( mouse_clicked ) {
    if ( global.game_flower_index == undefined ) {
        if ( flower_index == 0 ) {
            global.game_flower_index = flower_index;
            var _sound = audio_play_sound_at( snd_flower, x, y, z, 100, 300, 1, false, 1 );
            audio_sound_pitch( _sound, 1 - flower_index*0.1 );
            tr_instance_destroy();
        } else if ( flower_index == 4 ) {
            global.game_flower_index = flower_index;
            var _sound = audio_play_sound_at( snd_flower, x, y, z, 100, 300, 1, false, 1 );
            audio_sound_pitch( _sound, 1 - flower_index*0.1 );
            tr_instance_destroy();
        }
    } else if ( abs( flower_index - global.game_flower_index ) == 1 ) {
        var _sound = audio_play_sound_at( snd_flower, x, y, z, 100, 300, 1, false, 1 );
        audio_sound_pitch( _sound, 1 - flower_index*0.1 );
        tr_instance_destroy();
        global.game_flower_index = flower_index;
        if ( global.game_flower_index == 0 ) {
            global.happy_ending = true;
            with( obj_door_spawn ) door_spawn_time = current_time + 700;
        }
        if ( global.game_flower_index == 4 ) {
            with( obj_door_spawn ) door_spawn_time = current_time + 700;
        }
    }
}