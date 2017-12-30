if ( !TRACKER_ON ) return "<no vertex buffer dump, tracker off>";

var _str = "----- vertex buffer dump -----" + NL;

var _size = ds_list_size( global.tracker_instances );
if ( _size <= 0 ) return _str + "empty" + NL;

for( var _i = 0; _i < _size; _i++ ) {
    var _id = global.tracker_instances[| _i ];
    _str += string_space_padded( _i, TRACKER_ID_SPACE_PADDING ) + ":id=" + string_space_padded( _id, TRACKER_ID_SPACE_PADDING ) + ": " + tr_instance_details( _id, TRACE_DIV ) + NL;
}

return _str;