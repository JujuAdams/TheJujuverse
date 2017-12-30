if ( JIFFY_ON ) {
    trace( "JIFFY" );
    global.jiffy_accumulator             = 0;
    global.jiffy_time                    = get_timer();
    global.jiffy_instances               = ds_list_create();
    global.jiffy_render_alpha            = 1;
    global.jiffy_render_alpha_calculated = 0;
}