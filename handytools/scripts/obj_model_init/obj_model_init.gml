if ( OBJ_MODEL_ON ) {
	trace_f( "OBJ MODEL" );

	global.obj_map               = tr_map_create( "<.obj map>"     , true );
	global.obj_load_map          = tr_map_create( "<.obj load map>", true );
	global.obj_vertex_buffer_map = tr_map_create( "<.obj name map>", true );
}