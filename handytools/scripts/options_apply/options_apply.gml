audio_master_gain( options_get( "master volume" ) );
audio_group_set_gain( global.audio_group_map[? "music"  ], options_get( "music"  ), 200 );
audio_group_set_gain( global.audio_group_map[? "sounds" ], options_get( "sounds" ),   0 );
/*
if ( options_get( "window width"  ) >= display_get_width()  )
|| ( options_get( "window height" ) >= display_get_height() ) {
    options_set( "fullscreen", true );
}
*/