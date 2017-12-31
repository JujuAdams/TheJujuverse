/// @description AUDIO service initialisation

trace_f( "AUDIO (forced)" );
trace_f( "Loading audio groups (", AUDIO_GROUPS, " total)" );

global.audio_group_map = tr_map_create( "audio groups", true );
for( var _i = 0; _i < AUDIO_GROUPS; _i++ ) {
    global.audio_group_map[? audio_group_name( _i ) ] = _i;
    audio_group_load( _i );
}