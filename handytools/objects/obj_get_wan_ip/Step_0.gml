if ( current_time > creation_time + 10000 ) {
	trace_vf( "Can't find WAN IP" );
	instance_destroy();
}