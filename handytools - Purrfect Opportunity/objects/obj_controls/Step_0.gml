if ( control_property( 0, "state", "back" ) == PRESSED ) and ( room == rm_game ) gameflow_end();
if ( !RELEASE ) and ( keyboard_check_pressed( vk_f5 ) ) new_game_instance();