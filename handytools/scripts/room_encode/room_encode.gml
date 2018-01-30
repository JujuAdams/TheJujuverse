///room_encode()

var _root_map = tr_map_create();
_root_map[? "time" ] = date_datetime_string( date_current_datetime() );

editor_property_serialise_recursive( global.editor_scene_graph );
tr_map_add_map( _root_map, "scene graph", global.editor_scene_graph );

var _str = json_prettify_alphabetise( json_encode( _root_map ) );

tr_map_remove_map( _root_map, "scene graph" );
tr_map_destroy( _root_map );
return _str;