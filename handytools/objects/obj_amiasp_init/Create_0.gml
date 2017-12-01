surface_resize( application_surface, APP_SURF_W, APP_SURF_H );
application_surface_draw_enable( false );
display_set_gui_size( 960, 720 );

vertex_buffer_definitions();

instance_create( 0, 0, obj_screen );
instance_create( 0, 0, obj_debug );
instance_create( 0, 0, obj_game );

global.menu_page = 0;
randomize();