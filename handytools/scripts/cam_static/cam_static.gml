/// @param x
/// @param y

with( obj_camera ) {
	
	camera_focus_x = argument0;
	camera_focus_y = argument1;

	var _w = view_get_wport( view ) / camera_zoom;
	var _h = view_get_hport( view ) / camera_zoom;
	
	var _left = clamp( camera_focus_x - _w/2, 0, room_width  - _w );
	var _top  = clamp( camera_focus_y - _h/2, 0, room_height - _h );

	camera_set_view_pos( camera, _left, _top );
	camera_set_view_size( camera, _w, _h );

}