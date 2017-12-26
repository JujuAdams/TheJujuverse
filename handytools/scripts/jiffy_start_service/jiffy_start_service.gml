if ( JIFFY_ON ) {
	trace( "JIFFY" );
	instantiate_protected( obj_jiffy );
} else {
	trace_error_q( "Warning! JIFFY is off" );
}