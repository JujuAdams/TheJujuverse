/// @param list

var _list = argument0;
var _size = ds_list_size( _list );
for( var _i = 0; _i < _size; _i++ ) _list[| _i ] = noone;
ds_list_clear( _list );