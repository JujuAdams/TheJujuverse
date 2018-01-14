if ( global.fps_mode == E_FPS_MODE.DRAW ) || ( global.fps_mode == E_FPS_MODE.STEP_PLUS_DRAW ) {
    result = get_timer() - timer;
    smoothed_result = lerp( smoothed_result, result, FPS_SMOOTHING );
    ds_list_add( list, result );
    if ( ds_list_size( list ) > FPS_MAX_SAMPLES ) ds_list_delete( list, 0 );
}

if ( global.fps_show ) {
    
    var _str = "time = " + string_format( result, 4, 0 ) + "us // smoothed = " + string_format( smoothed_result, 4, 0 ) + "us";

    draw_set_font( fnt_consolas );
    draw_set_valign( fa_bottom );
    draw_set_colour( c_black );
    draw_text( 11, display_get_gui_height()- 9, _str );
    draw_set_colour( c_white );
    draw_text( 11, display_get_gui_height()-10, _str );
    draw_set_valign( fa_top );

    if ( global.fps_show_graph ) {
    
        if ( !imguigml_any_window_open() ) {
            var _size = ds_list_size( list );
            draw_sprite_ext( spr_white_pixel, 0, 0, 0, FPS_MAX_SAMPLES, 101, 0, c_white, 0.2 );
    
            for( var _i = 0; _i < _size; _i++ ) {
                var _t = list[| _i ] / FPS_TARGET_TIME - 1;
                draw_sprite_ext( spr_white_pixel, 0, _i, 51+_t*50, 1, 1, 0, c_black, 1 );
            }
    
            for( var _i = 0; _i < _size; _i++ ) {
                var _t = list[| _i ] / FPS_TARGET_TIME - 1;
                draw_sprite( spr_white_pixel, 0, _i, 50+_t*50 );
            }
    
        }
    
    }
    
}