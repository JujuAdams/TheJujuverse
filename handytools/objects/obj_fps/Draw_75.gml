timer = get_timer() - timer;
smoothed_timer = lerp( smoothed_timer, timer, FPS_SMOOTHING );

ds_list_add( list, timer );
if ( ds_list_size( list ) > FPS_MAX_SAMPLES ) ds_list_delete( list, 0 );

var _str = "frame time = " + string_format( timer, 4, 0 ) + "us // smoothed = " + string_format( smoothed_timer, 4, 0 ) + "us";

draw_set_font( fnt_consolas );
draw_set_valign( fa_bottom );
draw_set_colour( c_black );
draw_text( 11, display_get_gui_height()- 9, _str );
draw_set_colour( c_white );
draw_text( 11, display_get_gui_height()-10, _str );
draw_set_valign( fa_top );

if ( !imguigml_any_window_open() ) {
    var _size = ds_list_size( list );
    draw_primitive_begin( pr_pointlist );

    draw_set_colour( c_black );
    for( var _i = 0; _i < _size; _i++ ) {
        var _t = list[| _i ] / (1000000/room_speed) - 1;
        draw_vertex( _i, 56+_t*50 );
    }

    draw_set_colour( c_white );
    for( var _i = 0; _i < _size; _i++ ) {
        var _t = list[| _i ] / (1000000/room_speed) - 1;
        draw_vertex( _i, 55+_t*50 );
    }

    draw_primitive_end();
}

if ( FPS_MEASURE_FRAME ) timer = get_timer();