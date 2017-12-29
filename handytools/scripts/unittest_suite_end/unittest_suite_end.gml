/// @description close up the unit test suite
if (global.testnumber == global.testssucceeded) {
   show_message(string(global.testssucceeded) + "/" + string(global.testnumber) + " tests OK!");
} else {
   show_message(string(global.testssucceeded) + "/" + string(global.testnumber) + " tests OK! (FAILED TESTS)");
}