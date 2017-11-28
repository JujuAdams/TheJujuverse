master_init();

var _vbuff = tr_vertex_create_buffer( "test", true );
tracker_dump();

tr_vertex_set_protect( _vbuff, false );
tr_vertex_delete_buffer( _vbuff );
trace( tr_vertex_dump() );