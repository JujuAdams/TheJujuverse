persistent = true;

application_surface_draw_enable( false );
surface_resize( application_surface, global.app_surf_w, global.app_surf_h );
display_set_gui_size( DEFAULT_WINDOW_WIDTH, DEFAULT_WINDOW_HEIGHT );

if ( FPS_ON ) {
    smoothed_timer = 5000;
    frame_start_time = get_timer();
}

if ( ALLOW_DITHER ) {
    global.dither_sprite = dither_make_sprite();
    global.dither_texture = sprite_get_texture( global.dither_sprite, 0 );
}

if ( SCREEN_3D ) {
    global.click_array[ instance_count-1 ] = noone;
    global.click_array[                0 ] = noone;
    global.click_colour         = c_black;
    global.click_index          = 1;
    global.click_instance_over  = noone;
    global.click_depth          = 0.5;
    global.click_depth_smoothed = 0.5;
    global.click_distance       = DEFAULT_Z_NEAR + (DEFAULT_Z_FAR - DEFAULT_Z_NEAR)*global.click_depth;
}

light_priority = ds_priority_create();

grip_create( "2d", global.app_surf_w, global.app_surf_h, false, false );
if ( SCREEN_3D ) {
    
    if ( SCREEN_DEFERRED_LIGHTS && !ALLOW_MRT ) trace_error( "Deferred lights require MRTs! Check screen_config()" );
    
    global.screen_main_camera = "3d";
    grip_create( "3d", global.app_surf_w, global.app_surf_h, false, true );
    grip_activate( "3d", true ); //Use the 3D PoV grip as a view
    if ( SCREEN_DEFERRED_LIGHTS ) {
        grip_add_depth_surface( "3d" );
        grip_add_normal_surface( "3d" );
    }
    
    grip_create( "click", global.app_surf_w, global.app_surf_h, false, true );
    grip_activate( "click", SCREEN_CLICK_GRIP_AS_VIEW );
    
    blur_surface          = tr_surface_create( grip_get_width( "3d" ), grip_get_height( "3d" ) );
    blur_transfer_surface = tr_surface_create( grip_get_width( "3d" ), grip_get_height( "3d" ) );
    
} else {
    
    global.screen_main_camera = "2d";
    grip_activate( "2d", false ); //Use the 2D grip as a view
    
}

deferred_composite_surface = undefined;
if ( SCREEN_DEFERRED_LIGHTS ) deferred_composite_surface = tr_surface_create( grip_get_width(  global.screen_main_camera ),
                                                                             grip_get_height( global.screen_main_camera ),
                                                                             "SCREEN deferred lighting", true );

//Call custom script
if ( script_exists( SCREEN_CREATE_SCRIPT ) ) script_execute( SCREEN_CREATE_SCRIPT );