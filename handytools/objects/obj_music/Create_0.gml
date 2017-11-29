persistent = true; 

game_intro_played = false;
game_song = noone;

menu_transitioned = true;
menu_song = audio_play_sound( snd_menu_loop, 100, true );
audio_sound_gain( menu_song, 0, 0 );
audio_sound_gain( menu_song, 1, 2000 );
