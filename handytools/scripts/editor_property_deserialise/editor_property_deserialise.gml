/// @desc Returns the value of an EDITOR node's property
/// @param node_map
/// @param instance

var _list = argument0[? "properties" ];
var _size = ds_list_size( _list );
for( var _i = 0; _i < _size; _i++ ) {
    
    var _map = _list[| _i ];
    var _variable_name = _map[? "variable name" ];
    
    if ( _variable_name == undefined ) {
        trace( "Could not deserialise property ", QU, _map[? "name"], QU, " (", _i, ") of object ", QU, editor_property_value( argument0, "name" ), QU, " (", object_get_name( argument1.object_index ), ":", argument1, ")" );
        continue;
    }
    
    if ( _variable_name == "" ) continue;
    
    variable_instance_set( argument1, _variable_name, _map[? "value" ] );
    
}