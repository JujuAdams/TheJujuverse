global.editor_object_properties_map = tr_map_create( "EDITOR object properties", true );

//Define a null object
var _list = tr_list_create( concat( "EDITOR <null> properties" ), true );
tr_map_add_list( global.editor_object_properties_map, "<null>", _list );
editor_object_default_properties( "<null>", _list );

//Basically all objects in the game have the same properties so we inherit from the player spawner
editor_object_add_property( obj_player_spawn, "rotation", E_EDITOR_PROPERTY.FLOAT, 0, "image_angle" );
editor_object_copy_property( obj_player_spawn, [ obj_cube, obj_qubicle ] );

//...apart from lights which have additional properties
editor_object_add_property( obj_light, "colour", E_EDITOR_PROPERTY.COLOUR, c_white, "colour" );
editor_object_add_property( obj_light,  "range", E_EDITOR_PROPERTY.FLOAT ,     200,  "range" );
editor_object_copy_property( obj_light, obj_directional_light );

return global.editor_object_properties_map;