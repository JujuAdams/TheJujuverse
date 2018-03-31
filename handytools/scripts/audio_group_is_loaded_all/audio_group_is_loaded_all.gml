/// @descriptions Returns if all audio groups have been loaded successfully

if ( !audio_exists( 0 ) || !AUDIO_ON ) return true; //If there's nothing to load, don't wait for loading to happen!
for( var _i = 0; _i < AUDIO_GROUPS; _i++ ) if ( !audio_group_is_loaded( _i ) ) return false;
return true;