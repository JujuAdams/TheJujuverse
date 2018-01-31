/// @desc Returns the value of an EDITOR node's property
/// @param node_map

var _object_name = argument0[? "object" ];
if ( _object_name != undefined ) && ( _object_name != "<null>" ) {
    
    var _id = tr_instance_create_depth( 0, 0, 0, asset_get_index( _object_name ) );
    editor_property_deserialise( argument0, _id );
    argument0[? "instance" ] = _id;
    
} else {
    
    argument0[? "instance" ] = undefined;
    
}

var _list = argument0[? "children" ];
var _size = ds_list_size( _list );
for( var _i = 0; _i < _size; _i++ ) editor_property_deserialise_recursive( _list[| _i ] );