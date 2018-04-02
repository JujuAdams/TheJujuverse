/// @description DOTOBJ service initialisation

if ( DOTOBJ_ON ) {
    trace_f( "OBJ MODEL" );

    global.dotobj_map               = tr_map_create( "<.obj map>"        , true );
    global.dotobj_load_map          = tr_map_create( "<.obj load map>"   , true );
    global.dotobj_vertex_buffer_map = tr_map_create( "<.obj name map>"   , true );
    global.dotobj_texture_map       = tr_map_create( "<.obj texture map>", true );
}