/*
var _in_game = false;
if ( global.gameflow_state != e_game_state.menu ) _in_game = true;

if ( _in_game ) {
    
    if ( menu_transitioned ) {
        game_intro_played = false;
        menu_transitioned = false;
        audio_stop_sound( game_song );
    }
    
    if ( !game_intro_played ) {
        audio_sound_gain( menu_song, 0, 400 );
        game_song = phon_play( snd_bossa_nova_intro, 100, false );
        game_intro_played = true;
    } else if ( !audio_is_playing( game_song ) ) {
        if ( audio_sound_get_gain( menu_song ) < 0.05 ) audio_stop_sound( menu_song );
        game_song = phon_play( snd_bossa_nova_loop, 100, true );
    }
    
} else {
    
    if ( !menu_transitioned ) {
        
        menu_transitioned = true;
        
        audio_sound_gain( game_song, 0, 400 );
        if ( audio_is_playing( menu_song ) ) {
            audio_sound_gain( menu_song, 1, 1000 );
        } else {
            menu_song = phon_play( snd_menu_loop, 100, true );
            audio_sound_gain( menu_song, 0, 0 );
            audio_sound_gain( menu_song, 1, 2000 );
        }
    }
    
    if ( audio_sound_get_gain( game_song ) < 0.05 ) audio_stop_sound( game_song );
    
}
*/