///@param name

var _name = argument0;

for( var _i = GRIP_VIEWS_START; _i <= GRIP_VIEWS_END; _i++ ) {
	if ( global.grip_view_list[| _i ] == undefined ) {
		grip_activate_on_view( _name, _i )
		return _i;
	}
}

trace_error_q( false, "cannot find free view slot for grip camera ", QU, _name, QU );
return undefined;