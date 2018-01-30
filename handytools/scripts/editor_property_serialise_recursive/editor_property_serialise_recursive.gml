/// @desc Returns the value of an EDITOR node's property
/// @param node_map

var _id = argument0[? "##instance" ];
if ( _id != undefined ) {
    
    var _list = argument0[? "##properties" ];
    var _size = ds_list_size( _list );
    for( var _i = 0; _i < _size; _i++ ) {
    
        var _map = _list[| _i ];
        var _variable_name = _map[? "variable name" ];
    
        if ( _variable_name == undefined ) {
            trace( "Could not serialise property ", QU, _map[? "name"], QU, " (", _i, ") of object ", QU, editor_property_value( argument0, "name" ), QU, " (", object_get_name( _id.object_index ), ":", _id, ")" );
            continue;
        }
    
        if ( _variable_name == "" ) continue;
    
        if ( !variable_instance_exists( _id, _variable_name ) ) {
            trace_error( false, "Variable ", QU, _variable_name, QU, " does not exist in ", object_get_name( _id.object_index ), ":", _id );
            continue;
        }
    
        _map[? "value" ] = variable_instance_get( _id, _variable_name );
    
    }
    
}

var _list = argument0[? "##children" ];
var _size = ds_list_size( _list );
for( var _i = 0; _i < _size; _i++ ) editor_property_serialise_recursive( _list[| _i ] );