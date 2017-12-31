/// @description Executes the JIFFY update scripts for registered instances

var _new_time = get_timer();
var _frame_time = _new_time - global.jiffy_time;
_frame_time /= 1000000;

global.jiffy_time = _new_time;
global.jiffy_accumulator += _frame_time;

while( global.jiffy_accumulator >= JIFFY_DT ) {
    global.jiffy_accumulator -= JIFFY_DT;
    var _i = 0;
    repeat( ds_list_size( global.jiffy_instances ) ) {
        with( global.jiffy_instances[| _i++ ] ) script_execute( jiffy_update_script );
    }
}

global.jiffy_render_alpha = global.jiffy_accumulator/JIFFY_DT;
global.jiffy_render_alpha_calculated = 1.0 - global.jiffy_render_alpha;
