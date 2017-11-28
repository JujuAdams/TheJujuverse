event_inherited();

if ( mouse_clicked and !tween_doing_any() ) {
	transition( obj_transition_wipe, DEFAULT, DEFAULT, rm_single );
}

var _update = tween_perform( TWEEN_IN, false );
if ( _update ) {
	y = tween_erp_dsin( TWEEN_IN, ystart - room_height, ystart, 0 );
	script_execute( fit_function );
}

var _update = tween_perform( TWEEN_OUT, false );
if ( _update ) {
	y = tween_erp_dsin( TWEEN_OUT, ystart - room_height, ystart, 90 );
	script_execute( fit_function );
}