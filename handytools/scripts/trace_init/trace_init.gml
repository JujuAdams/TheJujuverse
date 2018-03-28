/// @description TRACE service initialisation

trace_f( "TRACE (forced default)" );

if ( TRACE_CACHE_MESSAGES ) {
    global.trace_cache_map = ds_map_create();
}