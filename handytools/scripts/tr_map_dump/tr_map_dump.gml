if ( !TRACKER_ON ) return "<no ds_map dump, tracker off>";

var _str = "----- ds_map dump -----" + NL;
    
var _size = ds_list_size( global.tracker_maps );
if ( _size <= 0 ) return _str + "empty" + NL;

for( var _i = 0; _i < _size; _i++ ) {
    var _id = global.tracker_maps[| _i ];
    _str += string_space_padded( _i, TRACKER_ID_SPACE_PADDING ) + ":id=" + string_space_padded( _id, TRACKER_ID_SPACE_PADDING ) + ": " + tr_map_details( _id, TRACE_DIV ) + NL;
}

return _str;

