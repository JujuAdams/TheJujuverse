/// @desc Returns the value of an EDITOR node's property
/// @param node_map

var _id = argument0[? "instance" ];
if ( _id != undefined ) editor_property_serialise( argument0, _id );

var _list = argument0[? "children" ];
var _size = ds_list_size( _list );
for( var _i = 0; _i < _size; _i++ ) editor_property_serialise_recursive( _list[| _i ] );