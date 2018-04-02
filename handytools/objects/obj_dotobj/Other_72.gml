var _id = async_load[? "id" ];
var _status = async_load[? "status" ];
    
var _obj_map = global.dotobj_load_map[? _id ];
if ( _obj_map != undefined ) {
    
    //Actually load the .obj
    var _array = dotobj_load_async_process( _obj_map, true );
    
    var _size = array_length_1d( _array );
    for( var _i = 0; _i < _size; _i += 3 ) {
        
        var _name          = _array[ _i     ];
        var _vertex_buffer = _array[ _i + 1 ];
        var _triangles     = _array[ _i + 2 ];
        
        if ( DOTOBJ_VERBOSE_LOAD && ( _size > 3 ) ) trace_f( "    (submodel ", _name, ")" );
        
        global.dotobj_vertex_buffer_map[? _name ] = _vertex_buffer;
        global.dotobj_texture_map[? _name ] = _obj_map[? "texture" ];
        
        var _map = tr_map_create();
        ds_map_copy( _map, _obj_map );
        _map[? "name"          ] = _name;
        _map[? "vertex buffer" ] = _vertex_buffer;
        _map[? "triangles"     ] = _triangles;
        
        ds_map_add_map( global.dotobj_map, _name, _map );
        
    }
    
    /*
    //Add to quick name lookup map
    var _name = _obj_map[? "name" ];
    global.dotobj_vertex_buffer_map[? _name ] = _vertex_buffer;
    global.dotobj_texture_map[? _name ] = _obj_map[? "texture" ];
    
    //Add to global .obj map
    tr_map_add_map( global.dotobj_map, _name, _obj_map );
    
    //Remove from the load map
    global.dotobj_load_map[? _id ] = undefined;*/
    tr_map_destroy( _obj_map );
    ds_map_delete( global.dotobj_load_map, _id );
    
}