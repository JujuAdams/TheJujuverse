if ( async_load[? "type" ] == "audiogroup_load" ) {
	
} else {
	
	var _id = async_load[? "id" ];
	var _status = async_load[? "status" ];
	
	var _obj_map = global.obj_load_map[? _id ];
	if ( _obj_map != undefined ) {
		load_obj_async_process( _obj_map, true );
		tr_map_add_map( global.obj_map, _obj_map[? "name" ], _obj_map );
		global.obj_load_map[? _id ] = undefined;
		ds_map_delete( global.obj_load_map, _id );
		trace( "Loaded ", _obj_map[? "filename" ] );
	}
	
}