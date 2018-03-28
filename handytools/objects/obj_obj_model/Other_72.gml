var _id = async_load[? "id" ];
var _status = async_load[? "status" ];
    
var _obj_map = global.obj_load_map[? _id ];
if ( _obj_map != undefined ) {
    
    //Actually load the .obj
    var _vertex_buffer = obj_model_load_async_process( _obj_map, true );
        
    //Add to quick name lookup map
    var _name = _obj_map[? "name" ];
    global.obj_vertex_buffer_map[? _name ] = _vertex_buffer;
    global.obj_texture_map[? _name ] = _obj_map[? "texture" ];
    
    //Add to global .obj map
    tr_map_add_map( global.obj_map, _name, _obj_map );
    
    //Remove from the load map
    global.obj_load_map[? _id ] = undefined;
    ds_map_delete( global.obj_load_map, _id );
    
}