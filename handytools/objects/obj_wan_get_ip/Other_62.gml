if ( async_load[? "id" ] == async_event ) {
    if ( async_load[? "status" ] == 0 ) {
        global.wan_ip = async_load[? "result" ];
        trace_f( "WAN IP found" );
        trace_v( "WAN IP is " + string( global.wan_ip ) );
        tr_instance_destroy();
    }
}