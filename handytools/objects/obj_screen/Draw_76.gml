frame_start_time = get_timer();

//click_array = undefined;
//click_array[0] = noone;

draw_set_colour( c_white );

global.click_index = 0;
global.click_array = undefined;
global.click_array[ instance_count-1 ] = noone;
with( all ) {
	my_click_index = global.click_index++;
	global.click_array[ my_click_index ] = id;
}