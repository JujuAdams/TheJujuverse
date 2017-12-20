for( var _i = GRIP_VIEWS_START; _i <= GRIP_VIEWS_END; _i++ ) {
	var _name = global.grip_view_list[| _i ];
	if ( _name == undefined ) continue;
	grip_activate_on_view( _name, _i );
}