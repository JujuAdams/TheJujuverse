camera_focus_list = tr_list_create();



camera_zoom      = 1;
camera_do_zoom   = false;
camera_focus_x   = 240;
camera_focus_y   = 135;
camera_state     = e_camera_state.follow;



view = 0;
view_enabled = true;
view_set_visible( view, true );
view_set_wport( view, DEFAULT_WINDOW_WIDTH );
view_set_hport( view, DEFAULT_WINDOW_HEIGHT );

var _w = view_get_wport( view )/camera_zoom;
var _h = view_get_hport( view )/camera_zoom;
camera = camera_create_view( camera_focus_x - _w/2, camera_focus_y - _h/2, _w, _h, 0, noone, -1, -1, 0, 0 );
view_set_camera( view, camera );



var _left   = room_width/2;
var _top    = room_height/2;
var _width  = view_get_wport( view ) * camera_zoom;
var _height = view_get_wport( view ) * camera_zoom;
camera_focus_array = [ _left, _top, _width, _height ];
