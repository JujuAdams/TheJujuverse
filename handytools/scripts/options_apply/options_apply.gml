/// @description Calls functions to apply option values to the game

global.audio_master_volume = options_get( "master volume" );
audio_group_set_gain( global.audio_group_map[? "music"  ], options_get( "music"  ), 200 );
audio_group_set_gain( global.audio_group_map[? "sounds" ], options_get( "sounds" ),   0 );
audio_master_gain( global.audio_master_volume * global.audio_master_on );
/*
if ( options_get( "window width"  ) >= display_get_width()  )
|| ( options_get( "window height" ) >= display_get_height() ) {
    options_set( "fullscreen", true );
}
*/