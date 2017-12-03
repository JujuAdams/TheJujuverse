surface_resize( application_surface, APP_SURF_W, APP_SURF_H );
application_surface_draw_enable( false );
display_set_gui_size( 960, 720 );

vertex_buffer_definitions();

instantiate_protected( obj_screen );
instantiate_protected( obj_debug );
instantiate_protected( obj_game );

global.menu_page = 0;
randomize();