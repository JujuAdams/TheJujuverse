if ( !TRACKER_ON ) return "<no ds_grid dump, tracker off>";

var _str = "----- ds_grid dump -----" + NL;

var _size = ds_list_size( global.tracker_grids );
if ( _size <= 0 ) return _str + "empty" + NL;

for( var _i = 0; _i < _size; _i++ ) {
    var _id = global.tracker_grids[| _i ];
    _str += string_space_padded( _i, TRACKER_ID_SPACE_PADDING ) + ":id=" + string_space_padded( _id, TRACKER_ID_SPACE_PADDING ) + ": " + tr_grid_details( _id, TRACE_DIV ) + NL;
}

return _str;