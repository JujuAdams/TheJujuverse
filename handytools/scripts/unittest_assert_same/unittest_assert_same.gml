/// @description Assert that the 2 given values are the same.
/// @param expected
/// @param given

var expected = argument0;
var given = argument1;
global.testnumber++;

show_debug_message("Testing #" + string(global.testnumber));

if (expected == given) {
    show_debug_message("OK");
    global.testssucceeded++;
} else {
    global.testsuccess = false;
    show_debug_message("             FAIL!");
    show_debug_message("Expected (+) Given (=)");
    show_debug_message("+" + string(expected));
    show_debug_message("=" + string(given));
}

