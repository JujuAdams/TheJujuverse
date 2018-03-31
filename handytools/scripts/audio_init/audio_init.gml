/// @description AUDIO service initialisation

trace_f( "AUDIO (forced)" );
trace_f( "Loading audio groups (", AUDIO_GROUPS, " total)" );

global.audio_master_volume = DEFAULT_MASTER_GAIN;
global.audio_master_on     = DEFAULT_MASTER_ON;
phon_master_gain( global.audio_master_volume * global.audio_master_on );

global.audio_group_map = tr_map_create( "audio groups", true );
for( var _i = 0; _i < AUDIO_GROUPS; _i++ ) {
    global.audio_group_map[? audio_group_name( _i ) ] = _i;
    audio_group_load( _i );
}