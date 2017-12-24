//*
transition( obj_transition_wipe, 300, 300, rm_scribble_test );
/*/
instantiate_protected( obj_gameflow );
instantiate_protected( obj_screen );
unload_current_room();
transition( obj_transition_wipe, 300, 300, rm_main );
//*/