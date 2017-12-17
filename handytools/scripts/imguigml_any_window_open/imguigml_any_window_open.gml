///@param array_of_exceptions

if ( argument_count == 0 ) {
	with( obj_par_imgui_window ) if ( window_show ) return true;
	return false;
}

var _exceptions = argument[0];
var _size = array_length_1d( _exceptions );
with( obj_par_imgui_window ) if ( window_show && ( array_find_index( _exceptions, id ) == undefined ) ) return true;
return false;