/// @desc Returns the value of an EDITOR node's property
/// @param node_map
/// @param name

var _list = argument0[? "properties" ];
var _size = ds_list_size( _list );
for( var _i = 0; _i < _size; _i++ ) {
    var _map = _list[| _i ];
    if ( _map[? "name" ] == argument1 ) return _map[? "value" ];
}

return undefined;